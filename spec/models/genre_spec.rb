require 'rails_helper'

describe Genre do
  context 'field validations' do
    it 'is invalid without a name' do
      genre = Genre.create(name: '')

      expect(genre).to_not be_valid
    end
  end
  context 'relationships' do
    it 'has many movie_genres' do
      genre = Genre.create!

      expect(genre).to have_many(:movie_genres)
    end
    it 'has many movies through movie_genres' do
      genre = Genre.create!

      expect(genre).to have_many(:movies).through(:movie_genres)
    end
  end
  context 'instance methods' do
    context '#avg_rating' do
      it 'calcluates the average of all genres\' related movies.' do
        director = Director.create!(name: 'big shot')
        genre = Genre.create!(name: 'Action')
        movie_1 = Movie.create!(title: 'Guardians of the Galaxy', description: 'Garbage', director_id: director.id, rating: 2)
        movie_2 = Movie.create!(title: 'Suicide Squad', description: 'Better garbage', director_id: director.id, rating: 4)
        movie_genre_1 = MovieGenre.create!(movie_id: movie_1.id, genre_id: genre.id)
        movie_genre_2 = MovieGenre.create!(movie_id: movie_2.id, genre_id: genre.id)

        expect(genre.avg_rating).to eq(3)
      end
    end
  end
end
