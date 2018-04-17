class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres

  def average_rating
    # binding.pry
    movies.average(:rating)
  end
end
