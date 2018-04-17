require "rails_helper"

describe "As an admin" do
  describe "When I visit the genre index" do
    describe "I fill out a form to create a new genre and click submit" do
      scenario "I can see the new genres along with a list of genres in the genres index page" do
        admin = User.create!(username: "admin", password: "password", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_genres_path

        click_on 'Create a Genre'

        fill_in 'genre[name]', with: 'Action'

        click_on 'Create Genre'

        expect(current_path).to eq(admin_genres_path)
        expect(page).to have_content("Admin Genres")
        expect(page).to have_content("Action")

        visit admin_genres_path

        click_on 'Create a Genre'

        fill_in 'genre[name]', with: 'Horror'

        click_on 'Create Genre'

        expect(current_path).to eq(admin_genres_path)
        expect(page).to have_content("Admin Genres")
        expect(page).to have_content("Horror")
        expect(page).to have_content("Action")
      end
    end
  end
end
