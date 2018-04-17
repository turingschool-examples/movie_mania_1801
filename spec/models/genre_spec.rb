require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it {is_expected.to have_many(:movies).through(:movie_genres)}
  end

  describe 'instance methods' do
    it '.average_rating' do
      genre = Genre.create(name: "Action")
      director = Director.create!(name: "director")
      movie_1 = director.movies.create!(title: 'Guardians of the Galaxy', description: "stuff happens in space", rating: 2)
      movie_2 = director.movies.create!(title: 'Suicide Squad', description: "stuff happens on earth", rating: 4)

      movie_genre_1 = MovieGenre.create(movie_id: movie_1.id, genre_id: genre.id)
      movie_genre_2 = MovieGenre.create(movie_id: movie_2.id, genre_id: genre.id)

      expect(genre.average_rating).to eq(3)
    end
  end
end
