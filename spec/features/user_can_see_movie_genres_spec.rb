require 'rails_helper'

feature 'Visitor' do
  context 'navigates to movie show page' do
    scenario 'they see the information for that movie' do
      director = Director.create(name: 'The Coen Brothers')
      movie = director.movies.create(title: 'Guardians of the Galaxy', description: 'Ragtag space rebels')

      visit movies_path

      click_on 'Guardians of the Galaxy'

      expect(current_path).to eq(movie_path(movie))
      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie.description)
    end

    scenario 'they see the genres for that movie' do
      director = Director.create(name: 'The Coen Brothers')
      movie = director.movies.create(title: 'Guardians of the Galaxy', description: 'Ragtag space rebels', rating: 4)
      genre_one = Genre.create(name: 'Action')
      genre_two = Genre.create(name: 'Adventure')
      genre_three = Genre.create(name: 'Sci-Fi')
      MovieGenre.create(movie: movie, genre: genre_one)
      MovieGenre.create(movie: movie, genre: genre_two)
      MovieGenre.create(movie: movie, genre: genre_three)

      visit movie_path(movie)

      expect(page).to have_content('Genres for this Movie:')

      within '.genres' do
        expect(page).to have_content(genre_one.name)
        expect(page).to have_content(genre_two.name)
        expect(page).to have_content(genre_three.name)
      end
    end

    scenario 'they see the rating for that movie' do
    end
  end
end
