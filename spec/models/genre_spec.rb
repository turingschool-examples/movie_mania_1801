require 'rails_helper'

describe Genre, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:movies).through(:genre_movies)}
  end

  describe 'validations' do
    it "is invalid without a name" do
      genre = Genre.new()

      expect(genre).to be_invalid
    end
    it "can be created" do
      genre = Genre.new(name: 'action')

      expect(genre).to be_valid
    end
  end

  describe 'methods' do
    it "can do average rating" do
      genre = Genre.create!(name: 'romance')
      director = Director.create!(name: "Someone")
      movie = director.movies.create!(title: "GoG", description: "Marvel Space", rating: 5)
      movie1 = director.movies.create!(title: "Ironman", description: "Metal Suit Dude", rating: 3)
      movie2 = director.movies.create!(title: "Thor", description: "Hammer Dude", rating: 4)

      movie.genre_movies.create(genre_id: genre)
      movie1.genre_movies.create(genre_id: genre)
      movie2.genre_movies.create(genre_id: genre)

      expect(genre.avg_rating).to eq(4)
    end
  end
end
