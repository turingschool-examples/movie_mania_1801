require 'rails_helper'

describe "unregistered user sees movies associated with genre" do
  context "they visit the genre index and click on a genre title" do
    it "displays all movies which are associated with that genre" do
      genre = Genre.create!(name: "Action")
      director = Director.create!(name: "Someone!")
      movie1 = genre.movies.create!(title: "Guardians of the Galaxy", description: "Owls, maybe?", rating: 3, director_id: director.id)
      movie2 = genre.movies.create!(title: "Suicide Squad", description: "Doesn't sound good...", rating: 2, director_id: director.id)

      visit genres_path

      click_on genre.name

      expect(page).to have_content(movie1.title)
      expect(page).to have_content(movie2.title)
      expect(page).to have_content("Average Movie Rating: 2.5")
    end
  end
end
