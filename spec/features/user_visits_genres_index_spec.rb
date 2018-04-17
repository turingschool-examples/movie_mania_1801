require 'rails_helper'

feature 'Visitor' do
  context 'visits the genre index page' do
    scenario 'does not see a form to create genre' do
      Genre.create(name: 'Action')
      Genre.create(name: 'Adventure')
      Genre.create(name: 'Sci-Fi')

      visit genres_path

      expect(page).to_not have_css('.genre-form')
      expect(page).to_not have_button('Create Genre')
    end

    scenario 'sees a list of genre names' do
      Genre.create(name: 'Action')
      Genre.create(name: 'Adventure')
      Genre.create(name: 'Sci-Fi')

      visit genres_path

      expect(page).to have_content('Action')
      expect(page).to have_content('Adventure')
      expect(page).to have_content('Sci-Fi')
    end
  end
end
