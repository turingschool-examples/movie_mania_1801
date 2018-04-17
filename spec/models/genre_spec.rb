require 'rails_helper'

describe Genre, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:genre_movies)}
    it {is_expected.to have_many(:movies).through(:genre_movies)}
  end
  describe 'instance methods' do
    it '.average_rating' do
      genre = Genre.create!(name: 'action')
      director = Director.create!(name: 'Ian Douglas')
      movie_1 = genre.movies.create!(title: 'Guardians of the Galaxy', description: 'Chris Pratt rules', rating: 5, director_id: director.id)
      movie_2 = genre.movies.create!(title: 'Suicide Squad', description: 'More comic book funz', rating: 1, director_id: director.id)

      expect(genre.average_rating).to eq(3)
    end
  end
end
