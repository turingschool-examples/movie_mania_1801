class Genre < ApplicationRecord
  validates_presence_of :name
  has_many :movie_genres, :class_name => 'MovieGenre'
  has_many :movies, through: :movie_genres

  def average_rating
    movies.average(:rating)
  end
end
