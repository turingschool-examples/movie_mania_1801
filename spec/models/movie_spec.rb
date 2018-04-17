require 'rails_helper'

describe Movie, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:actors).through(:actor_movies)}
  end

  describe 'activerecord' do
    it 'returns average rating of movies' do
      director = Director.create!(name: 'Wakowski Sisters')
      movie1 = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Practically perfect in every way", rating: 5)
      movie2 = Movie.create!(director_id: director.id, title: "Suicide Squad", description: "Practically perfect in every way", rating: 15)

      average = (movie1.rating + movie2.rating) / 2

      expect(Movie.average_rating).to eq(average)
    end
  end
end
