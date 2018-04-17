require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:title)}
  end
  describe 'relationships' do
    it {is_expected.to have_many(:movies).through(:movie_genres)}
  end
  describe "instance methods" do
    it "can find average_rating" do
      director = Director.create(name: "James Gunn")
      genre1 = Genre.create(title: "Action")
      movie1 = genre1.movies.create(title: "Guardians of the Galaxy", description: "Good", rating: 5, director_id: director.id)
      movie2 = genre1.movies.create(title: "Suicide Squad", description: "Good", rating: 1, director_id: director.id)

      expect(genre1.average_rating).to eq(3)
    end
  end
end
