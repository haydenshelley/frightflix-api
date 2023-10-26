class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :user_movies
  has_many :movies, through: :user_movies
end
