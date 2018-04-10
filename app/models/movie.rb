class Movie < ApplicationRecord
  has_many :actor_movies
  has_many :actors, through: :actor_movies
  belongs_to :director

  before_save :generate_slug

  private
  def generate_slug
    self.slug = title.parameterize
  end
end
