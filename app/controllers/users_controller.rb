class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    render plain: User.order(:id).map{ |user| user.info }.join("\n")
  end

  def create
    user = User.create!(first_name: params[:first_name],
      last_name: params[:last_name],
      gender: params[:gender],
      email: params[:email],
      password: params[:password])
      session[:current_user_id] = user.id
      redirect_to hostel_index_path
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

end
