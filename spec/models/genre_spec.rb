require 'rails_helper'

describe Genre, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:movies).through(:movie_genres)}
  end
  describe 'activerecord' do
    it 'returns average rating of movies for a genre' do
      genre1 = Genre.create!(name: "Horror")
      genre2 = Genre.create!(name: "Thriller")
      director = Director.create!(name: 'Wakowski Sisters')
      movie1 = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Practically perfect in every way", rating: 2)
      movie2 = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Practically perfect in every way", rating: 4)
      movie3 = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Practically perfect in every way", rating: 1)
      movie4 = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Practically perfect in every way", rating: 3)
      MovieGenre.create!(movie_id: movie1.id, genre_id: genre1.id)
      MovieGenre.create!(movie_id: movie2.id, genre_id: genre1.id)
      MovieGenre.create!(movie_id: movie3.id, genre_id: genre2.id)
      MovieGenre.create!(movie_id: movie4.id, genre_id: genre2.id)
      genre1_average = (movie1.rating + movie2.rating) / 2
      genre2_average = (movie3.rating + movie4.rating) / 2

      expect(genre1.average_rating).to eq(genre1_average)
      expect(genre2.average_rating).to eq(genre2_average)
    end
  end
end
