class User < ApplicationRecord
  def index
    if current_user
      redirect_to hostel_path
    else
    render "index"
  end
end
