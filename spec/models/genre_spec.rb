require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'Validations' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to have_many(:movies).through(:movie_genres)}
  end

  describe 'Instance Methods' do
    scenario '#average_rating' do
      director = Director.create!(name: "Someone!")
      movie_1 = director.movies.create!(title: 'Guardians of the Galaxy', description: 'Stupid Movie', rating: 1)
      movie_2 = director.movies.create!(title: 'Suicide Squad', description: 'Awesome Movie', rating: 5)
      genre = Genre.create!(name: 'Action')
      MovieGenre.create!(movie: movie_1, genre: genre)
      MovieGenre.create!(movie: movie_2, genre: genre)

      expect(genre.average_rating).to eq(3)
    end
  end
end
