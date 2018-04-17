require "rails_helper"

describe "admin" do
  describe "When I visit the genre index" do
    scenario "I can see a form to create new genres" do
      admin = User.create!(username: "admin", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genre_path

      fill_in 'genre[name]', with: 'action'

      click_on 'Create Genre'

      expect(page).to have_content("action")
    end
  end
end

describe "unregistered user" do
  describe "When I visit the genre index" do
    scenario "I see list of genres but no form" do
      genre0 = Genre.create!(name: 'romance')
      genre1 = Genre.create!(name: 'comedy')
      genre2 = Genre.create!(name: 'scifi')
      visit genre_path

      expect(page).to_not have_content("Create Genre")
      expect(page).to have_content(genre0.name)
      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)

      click_on 'romance'

      expect(current_path).to eq(genre_path(genre0))
    end
  end
end
