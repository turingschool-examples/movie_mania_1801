require 'rails_helper'

describe 'unregistered user' do
  describe 'visits movie index' do
    it 'clicks on GotG' do
      director = Director.create(name: 'Dougie B')
      movie = Movie.create(title: 'Guardians of the Galaxy', description: 'People destroy the galaxy. People stop it', director_id: director.id)
      visit movies_path

      click_on 'Guardians of the Galaxy'

      expect(current_path).to eq(movie_path(movie))
    end
    it 'sees the listed genres for this movie' do
      director = Director.create(name: 'Dougie B')
      movie = Movie.create(title: 'Guardians of the Galaxy', description: 'People destroy the galaxy. People stop it', director_id: director.id)
      movie.genres.create(name: 'Action')
      movie.genres.create(name: 'Adventure')
      movie.genres.create(name: 'Sci-Fi')

      visit movie_path(movie)

      expect(page).to have_content('Genres for this Movie:')
      expect(page).to have_content('Action')
      expect(page).to have_content('Adventure')
      expect(page).to have_content('Sci-Fi')
    end
    it 'sees the movies rating' do
      director = Director.create(name: 'Dougie B')
      movie = Movie.create(title: 'Guardians of the Galaxy', description: 'People destroy the galaxy. People stop it', director_id: director.id, rating: 4)
      movie.genres.create(name: 'Action')
      movie.genres.create(name: 'Adventure')
      movie.genres.create(name: 'Sci-Fi')

      visit movie_path(movie)

      expect(page).to have_content('Rating: 4')
    end
  end
end
