require 'rails_helper'

describe "unregistered user sees all genres" do
  context "they visit the genres index" do
    it "displays all genres which are links to show pages" do
      genre1 = Genre.create!(name: "SciFi")
      genre2 = Genre.create!(name: "Drama")
      genre3 = Genre.create!(name: "Comedy")

      visit genres_path

      expect(page).to have_link(genre1.name)
      expect(page).to have_link(genre2.name)
      expect(page).to have_link(genre3.name)
    end

    it "does not display the form to create a new genre" do
      visit genres_path

      expect(page).to_not have_content("Create Genre")
    end
  end
end
