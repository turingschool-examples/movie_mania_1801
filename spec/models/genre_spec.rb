require 'rails_helper'

describe Genre, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:movies).through(:movie_genres)}
  end

  describe 'methods' do
    it '.average_rating' do
      director = Director.create!(name: 'Wakowski Sisters')
      movie = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Practically perfect in every way", rating: 5)
      movie2 = Movie.create!(director_id: director.id, title: "Suicide Squad", description: "Practically perfect in every way", rating: 3)
      genre = Genre.create!(name: 'Action')
      genre.movies << movie
      genre.movies << movie2

      expect(genre.average_rating).to eq(4)
    end
  end
end
