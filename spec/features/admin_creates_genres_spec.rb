require 'rails_helper'

describe 'As an admin user' do
  context 'when I visit the genre index' do
    it 'I can fill out a form to create a new genre' do
      admin = User.create!(username: "user", password: "pass", role: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit(genres_path)

      fill_in 'Name', with: 'Action'
      click_on 'Submit'

      expect(current_path).to eq(genres_path)
      expect(page).to have_content('Action')
    end
  end
end
