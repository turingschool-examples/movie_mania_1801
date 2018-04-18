require 'rails_helper'

describe 'Unregistered User' do
  context 'visits genre index' do
    it 'should have at least two genres but not the form to create genre' do
      genre1 = Genre.create(name: 'Action')
      genre2 = Genre.create(name: 'Comedy')

      visit genres_path

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
      expect(page).to_not have_content('Create New Genres Here')
      expect(page.has_no_field?)
    end
  end
end
