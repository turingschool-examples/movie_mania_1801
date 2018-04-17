require 'rails_helper'

describe Genre do
  context 'relationships' do
    it 'has many movie_genres' do
      genre = Genre.create!

      expect(genre).to have_many(:movie_genres)
    end
    it 'has many movies through movie_genres' do
      genre = Genre.create!

      expect(genre).to have_many(:movies).through(:movie_genres)
    end
  end
end
