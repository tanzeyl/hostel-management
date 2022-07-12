class User < ApplicationRecord
  has_many :todos
  has_secure_password
  def info
    "#{id}. Name: #{name} Email: #{email}  "
  end
end
