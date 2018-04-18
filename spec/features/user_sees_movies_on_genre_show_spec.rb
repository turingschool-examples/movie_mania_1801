require 'rails_helper'

describe 'unregistered user' do
  describe 'visits genre index' do
    it 'clicks on actions' do
      director = Director.create(name: 'Dougie B')
      genre = Genre.create(name: 'Action')
      genre.movies.create(title: 'Guardians of the Galaxy', description: 'People destroy the galaxy. People stop it', director_id: director.id, rating: 4)
      genre.movies.create(title: 'Suicide Squad', description: 'People suicide themselves. No one stops it', director_id: director.id, rating: 2)

      visit genres_path

      click_on 'Action'

      expect(current_path).to eq(genre_path(genre))
      expect(page).to have_content('Action')
      expect(page).to have_content('Guardians of the Galaxy')
      expect(page).to have_content('Suicide Squad')
      expect(page).to have_content('Average rating of movies in this genre: 3')
    end
  end
end
