class Movie < ApplicationRecord
  has_many :actor_movies
  has_many :genre_movies
  has_many :actors, through: :actor_movies
  has_many :genres, through: :genre_movies
  belongs_to :director
end
