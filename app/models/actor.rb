class Actor < ApplicationRecord
  validates_presence_of :name
  has_many :actor_movies
  has_many :movies, through: :actor_movies
end
