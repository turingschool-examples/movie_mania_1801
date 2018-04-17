require 'rails_helper'

describe Genre do
  context 'relationships' do
    it 'has many movie_genres' do
      genre = Genre.create!

      expect(genre).to belong_to(:movie_genre)
    end
    it 'has many movies through movie_genres' do
      genre = Genre.create!

      expect(genre).to have_many(:movie).through(:movie_genres)
    end
  end
end
