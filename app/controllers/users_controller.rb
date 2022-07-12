class UsersController < ApplicationController
  def index
    render plain: User.order(:id).map{ |user| user.info }.join("\n")
  end

  def create
    User.create!(first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password])
      redirect_to "/"
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
