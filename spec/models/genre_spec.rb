require 'rails_helper'

describe Genre, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:movies).through(:movie_genres)}
  end

  describe 'methods' do
    it '#average_rating' do
      director = Director.create(name: 'Dougie B')
      genre = Genre.create(name: 'Action')
      genre.movies.create(title: 'Guardians of the Galaxy', description: 'People destroy the galaxy. People stop it', director_id: director.id, rating: 4)
      genre.movies.create(title: 'Borgs of the Galaxy', description: 'People borg the borg. borg stop it', director_id: director.id, rating: 2)

      expect(genre.average_rating).to eq(3)
    end
  end
end
