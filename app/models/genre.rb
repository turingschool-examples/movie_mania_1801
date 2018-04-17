class Genre < ApplicationRecord
  validates_presence_of :title

  has_many :movie_genres
  has_many :movies, through: :movie_genres

  def average_rating
    movies.average(:rating)
  end

end
