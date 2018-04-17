class Genre < ApplicationRecord
  has_many :movie_genres, :class_name => 'MovieGenre'
  has_many :movies, through: :movie_genres
end
