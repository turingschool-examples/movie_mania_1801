require 'rails_helper'

describe 'Unregistered user' do
  describe 'visits the movies index' do
    describe 'and clicks on a movie' do
      it 'and is sent to the movies page' do

        genre_1 = Genre.create(name: "Sci-Fi")
        genre_2 = Genre.create(name: "Action")
        genre_3 = Genre.create(name: "Adventure")
        director = Director.create!(name: "director")
        movie = director.movies.create!(title: 'Guardians of the Galaxy', description: "stuff happens in space")

        movie_genre_1 = MovieGenre.create(movie_id: movie.id, genre_id: genre_1.id)
        movie_genre_2 = MovieGenre.create(movie_id: movie.id, genre_id: genre_2.id)
        movie_genre_3 = MovieGenre.create(movie_id: movie.id, genre_id: genre_3.id)

        visit directors_path

        click_on director.name

        expect(current_path).to eq(movies_path)

        click_on movie.title

        expect(current_path).to eq(movie_path(movie))
      end

      it 'and clicks on a movie and sees movie name and all associated genres and its rating' do

        genre_1 = Genre.create(name: "Sci-Fi")
        genre_2 = Genre.create(name: "Action")
        genre_3 = Genre.create(name: "Adventure")
        director = Director.create!(name: "director")
        movie = director.movies.create!(title: 'Guardians of the Galaxy', description: "stuff happens in space", rating: 3)

        movie_genre_1 = MovieGenre.create(movie_id: movie.id, genre_id: genre_1.id)
        movie_genre_2 = MovieGenre.create(movie_id: movie.id, genre_id: genre_2.id)
        movie_genre_3 = MovieGenre.create(movie_id: movie.id, genre_id: genre_3.id)

        visit directors_path

        click_on director.name

        click_on movie.title

        expect(page).to have_content(movie.title)
        expect(page).to have_content(movie.rating)
        expect(page).to have_content("Genres for this Movie:")
        expect(page).to have_content(genre_1.name)
        expect(page).to have_content(genre_2.name)
        expect(page).to have_content(genre_3.name)
      end
    end
  end
end
