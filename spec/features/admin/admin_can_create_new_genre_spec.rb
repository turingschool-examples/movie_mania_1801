require "rails_helper"

describe "As an admin" do
  describe "When I visit the genre index" do
    describe "I fill out a form to create a new genre and click submit" do
      scenario "I can see the new genres along with a list of genres in the genres index page" do
        admin = User.create!(username: "admin", password: "password", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit genres_path
        new_genre = 'Action'

        expect(page).to_not have_content(new_genre)

        click_on 'Create Genre'
        fill_in 'genre[name]', with: 'Action'
        click_on 'Create Genre'

        expect(current_path).to eq(genres_path)
        expect(page).to have_content("Action")
      end

      scenario "I should get a flash message if it fails to create a genre" do
        admin = User.create!(username: "admin", password: "password", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit genres_path

        click_on 'Create Genre'

        expect(current_path).to eq(genres_path)
        expect(page).to have_content('Genre could not be created. Please try again!')
      end
    end
  end
end
