class Movie < ApplicationRecord
  has_many :actor_movies
  has_many :actors, through: :actor_movies
  belongs_to :director
  has_many :movie_genres, :class_name => 'MovieGenre'
  has_many :genres, through: :movie_genres

end
