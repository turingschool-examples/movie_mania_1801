require 'rails_helper'

describe Movie, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:actors).through(:actor_movies)}
    it {is_expected.to have_many(:genres).through(:movie_genres)}
  end
  describe 'class_methods' do
    it '.average_rating' do
      director = Director.create!(name: "Someone!")
      director.movies.create!(title: "Guardians of the Galaxy", description: "Owls, maybe?", rating: 3)
      director.movies.create!(title: "Suicide Squad", description: "Doesn't sound good...", rating: 2)

      expect(Movie.average_rating).to eq(2.5)
    end
  end
end
