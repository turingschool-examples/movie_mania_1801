require 'rails_helper'

describe 'Admin' do
  describe 'visits the genre index' do
    it 'and submits a completed form and it updates page with new genre' do
      admin = User.create(username: "admin", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      genre_name = "Comedy"

      expect(page).to have_content("Create a New Genre")

      fill_in 'genre[name]', with: genre_name
      click_on 'Create Genre'

      expect(current_path).to eq(genres_path)
      expect(page).to have_content(genre_name)
    end
  end
end

# We are going to add genres to movies (this is SEPARATE from categories).
# A movie can have more than one genre (example: "Action", "Adventure")
# and a genre can have more than one movie. Please test for this functionality.

# As an admin user,
# When I visit the genre index,
# I can see a form to create new genres,
# When I fill out the form with the genre's name,
# And click submit,
# I see a list of genres I have created.
