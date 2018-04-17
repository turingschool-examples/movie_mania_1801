require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_uniqueness_of(:name)}
  end

  describe 'relationships' do
    it {is_expected.to have_many(:movies).through(:movie_genres)}
  end

  describe 'instance methods' do
    it '.average_rating' do
      director = Director.create(name: 'Darth Plagueis the Wise')
      movie1 = director.movies.create(title: 'Guardians of the Galaxy', description: 'Bad', rating: 3)
      movie2 = director.movies.create(title: 'Barnacle Barry', description: 'Bad', rating: 5)
      movie3 = director.movies.create(title: 'Stooped Up Stew', description: 'Bad', rating: 1)
      movie4 = director.movies.create(title: 'Hello Ramen', description: 'Bad', rating: 3)
      genre = Genre.create(name: 'Action')

      genre.movies << movie1
      genre.movies << movie2
      genre.movies << movie3
      genre.movies << movie4

      expect(genre.average_rating).to eq(3)
    end
  end
end
