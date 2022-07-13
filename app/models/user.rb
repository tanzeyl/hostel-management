class User < ApplicationRecord
  has_many :todos
  has_secure_password
  validates :first_name, presence: true
  validates :email, presence: true
  def info
    "#{id}. Name: #{name} Email: #{email}  "
  end
end
