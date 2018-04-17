require 'rails_helper'

describe Genre do
  describe 'relationships' do
    it { should have_many(:movie_genres) }
    it { should have_many(:movies) }
  end

  describe 'instance methods' do
    it 'should calculate #average_rating' do
      director = Director.create(name: 'The Coen Brothers')
      guardians = director.movies.create(title: 'Guardians of the Galaxy', description: 'Ragtag space rebels', rating: 4)
      squad = director.movies.create(title: 'Suicide Squad', description: 'Bad at being good', rating: 2)
      genre = Genre.create(name: 'Action')
      MovieGenre.create(movie: guardians, genre: genre)
      MovieGenre.create(movie: squad, genre: genre)

      expect(genre.average_rating).to eq(3)
    end
  end
end
