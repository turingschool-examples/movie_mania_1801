class MovieGenre < ApplicationRecord
  has_many :genres
  has_many :movies
end
