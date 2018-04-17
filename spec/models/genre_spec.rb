require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'validations' do
    it { validate_presence_of :name }
  end

  describe 'relationships' do
   it { should have_many(:movie_genres) }
   it { should have_many(:movies) }
 end

 describe 'methods' do
   it 'should give average' do
     director = Director.create!(name: 'Keller Man')
     genre_1 = Genre.create!(name: 'Action')
     movie_1 = genre_1.movies.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Practically ridiculous", rating: 4)
     movie_2 = genre_1.movies.create!(director_id: director.id, title: "Suicide Squad", description: "Nonsense", rating: 2)


     expect(genre_1.average_movie_rating).to eq(3)
   end
 end
end
