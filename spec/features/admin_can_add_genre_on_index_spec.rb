require 'rails_helper'

describe 'As an admin user,' do
  describe 'When I visit the genre index' do
    it 'I can fill out a form to create a new genre' do
      visit genres_path

      fill_in 'genre[name]', with: 'Action'
      click_on 'Create Genre'

      genre = Genre.last

      expect(page).to have_content(genre.name)
    end
  end
end
