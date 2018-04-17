class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres

  def avg_rating
    movies.average(:rating)
  end
end
