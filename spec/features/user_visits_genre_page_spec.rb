require 'rails_helper'

describe 'Unregistered user' do
  describe 'navigates to a genre show page via the genre index' do
    it 'see genre name and all movies for that genre' do
      genre = Genre.create(name: "Action")
      director = Director.create!(name: "director")
      movie_1 = director.movies.create!(title: 'Guardians of the Galaxy', description: "stuff happens in space", rating: 2)
      movie_2 = director.movies.create!(title: 'Suicide Squad', description: "stuff happens on earth", rating: 4)

      movie_genre_1 = MovieGenre.create(movie_id: movie_1.id, genre_id: genre.id)
      movie_genre_2 = MovieGenre.create(movie_id: movie_2.id, genre_id: genre.id)

      visit genres_path

      click_on genre.name

      expect(current_path).to eq(genre_path(genre))
      expect(page).to have_content(genre.name)
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
    end

    it 'sees aaverage rating of all movies in the genre' do
      genre = Genre.create(name: "Action")
      director = Director.create!(name: "director")
      movie_1 = director.movies.create!(title: 'Guardians of the Galaxy', description: "stuff happens in space", rating: 2)
      movie_2 = director.movies.create!(title: 'Suicide Squad', description: "stuff happens on earth", rating: 4)

      movie_genre_1 = MovieGenre.create(movie_id: movie_1.id, genre_id: genre.id)
      movie_genre_2 = MovieGenre.create(movie_id: movie_2.id, genre_id: genre.id)

      visit genres_path

      click_on genre.name

      expect(page).to have_content(genre.average_rating)
    end
  end
end
