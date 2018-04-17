require 'rails_helper'

feature 'Admin' do
  context 'on the genre index page' do
    scenario 'can create a new genre' do
      admin = User.create!(username: "admin", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      fill_in 'genre[name]', with: 'Action'
      click_on 'Create Genre'

      expect(current_path).to eq(genres_path)
      expect(page).to have_content('Action')
      expect(page).to have_content('Action was successfully created')
    end
  end
end
