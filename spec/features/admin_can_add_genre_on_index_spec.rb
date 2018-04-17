require 'rails_helper'

describe 'As an admin user,' do
  describe 'When I visit the genre index' do
    it 'I can fill out a form to create a new genre' do
      admin = User.create(username: 'funbucket13', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit genres_path

      fill_in 'genre[name]', with: 'Action'
      click_on 'Create Genre'

      genre = Genre.last

      expect(page).to have_content(genre.name)
    end
  end
end

describe 'As an unregister user,' do
  describe 'When I visit the genre index' do
    it 'I am unable to fill out a form to create a new genre' do
      genre = Genre.create!(name: "Action")
      genre2 = Genre.create!(name: "Adventure")
      visit genres_path

      expect(page).to_not have_button('Create Genre')

      expect(page).to have_content(genre.name)
      expect(page).to have_content(genre2.name)

    end
  end
end
