require 'rails_helper'

describe "As an admin" do
  context "they visit the genre index" do
    it "and fill in a form to create a new genre" do
      admin = User.create!(username: 'fluffy', password: 'test', role: 'admin')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      click_on 'Create Genre'

      expect(page).to have_content('Genre not created, try again.')
    end
  end

  context "they visit the genre index" do
    it "and fill in a form to create a new genre" do
      admin = User.create!(username: 'fluffy', password: 'test', role: 'admin')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit genres_path

      fill_in 'genre[name]', with: 'Action'
      click_on 'Create Genre'

      expect(current_path).to eq(genres_path)
      expect(page).to have_content('Action Genre Added')
    end
  end
end
