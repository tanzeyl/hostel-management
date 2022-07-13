class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    render plain: User.order(:id).map{ |user| user.info }.join("\n")
  end

  def create
    user = User.new(first_name: params[:first_name],
      last_name: params[:last_name],
      gender: params[:gender],
      email: params[:email],
      role: "student",
      password: params[:password])
      if user.save
        session[:current_user_id] = user.id
        redirect_to hostel_index_path
      else
        flash[:error] = user.errors.full_messages.join(", ")
        redirect_to new_user_path
      end
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email)
    if user.password = password
      render plain: " #{user.id} true "
    else
      render plain: " #{user.id} false "
    end
  end

  def new
    render "users/new"
  end

  def changeP
    render "password"
  end

  def changePassword
    newPass = params[:new_p]
    retype = params[:retype]
    if newPass != retype
      flash[:error] = "Passwords don't match."
      redirect_to password_path
    else
      @current_user.password_digest = newPass
      @current_user.save!
      flash[:error] = "Password successfully changed."
      redirect_to hostel_index_path
    end
  end

end
