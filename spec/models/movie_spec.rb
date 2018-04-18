require 'rails_helper'

describe Movie, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:actors).through(:actor_movies)}
    it { should have_many(:genres) }
  end

  describe 'Class methods' do
    it 'should be able to average movie rankings' do
      director = Director.create!(name: 'Wakowski Sisters')
      movie_1 = Movie.create!(director_id: director.id, title: "Mary Poppins", description: "Practically perfect in every way", rating: 4)
      movie_2 = Movie.create!(director_id: director.id, title: "Goonies", description: "Goonies never say die", rating: 1)
      movie_3 = Movie.create!(director_id: director.id, title: "Not Mary Poppins", description: "Goonies never say die", rating: 3)
      movie_4 = Movie.create!(director_id: director.id, title: "Not Goonies", description: "Goonies never say die", rating: 2)

      ratings = [movie_1.rating, movie_2.rating, movie_3.rating, movie_4.rating]
      average = ratings.sum / ratings.length

      expect(director.movies.average_rating).to eq(average)
    end
  end
end
