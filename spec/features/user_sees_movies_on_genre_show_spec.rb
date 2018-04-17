require 'rails_helper'

describe 'unregistered user' do
  describe 'visits genre index' do
    it 'clicks on actions' do
      director = Director.create(name: 'Dougie B')
      genre = Genre.create(name: 'Action')
      movie1 = genre.movies.create(title: 'Guardians of the Galaxy', description: 'People destroy the galaxy. People stop it', director_id: director.id, rating: 4)
      movie2 = genre.movies.create(title: 'Suicide Squad', description: 'People suicide themselves. No one stops it', director_id: director.id, rating: 3)

      visit genres_path

      click_on 'Action'

      expect(current_path).to eq(genre_path(genre))
      expect(page).to have_content('Action')
      expect(page).to have_content('Guardians of the Galaxy')
      expect(page).to have_content('Suicide Squad')
    end
  end
end
