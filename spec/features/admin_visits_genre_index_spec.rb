require 'rails_helper'

describe 'admin' do
  describe 'visits genre index' do
    it 'sees and fills a form to create a new genre' do
      admin = User.create(username: 'name', password: 'password', role: 'admin')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      expect(page).to have_content('Create a new genre:')
      expect(page).to have_button('Create Genre')

      fill_in 'genre[name]', with: 'Incredikelly'
      click_on 'Create Genre'

      expect(current_path).to eq(genres_path)
      expect(page).to have_content('Incredikelly')
    end
  end
end
