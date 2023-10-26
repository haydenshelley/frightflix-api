class Movie < ApplicationRecord
  has_many :user_movies
  belongs_to :category
end
