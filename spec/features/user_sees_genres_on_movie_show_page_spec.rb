require 'rails_helper'

describe 'As a visitor' do
  context 'when I visit the movie index and link to a show page' do
    it 'I see title, genres, and movie rating' do
      movie = Movie.create!(title: 'Guardians of the Galaxy', description: 'Chris Pratt is the best')
      genre_1 = movie.genres.create!(name: 'Action')
      genre_2 = movie.genres.create!(name: 'Adventure')
      genre_3 = movie.genres.create!(name: 'Sci-Fi')

      visit movies_path
      click_on movie.title

      expect(current_path).to eq(movie_path(movie))
      expect(page).to have_content(movie.title)
      expect(page).to have_content('Genres for this Movie:')

      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
      expect(page).to have_content(genre_3.name)
      expect(page).to have_content(movie.rating)
    end
  end
end
