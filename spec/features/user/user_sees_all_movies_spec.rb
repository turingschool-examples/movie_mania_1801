require 'rails_helper'

describe "user sees all movies" do
  context "they visit the movies index" do
    it "displays all movies and their information" do
      director = Director.create!(name: 'Wakowski Sisters')
      movie_1 = Movie.create!(director_id: director.id, title: "Mary Poppins", description: "Practically perfect in every way")
      movie_2 = Movie.create!(director_id: director.id, title: "Goonies", description: "Goonies never say die")

      visit "/movies"

      expect(page).to_not have_content("All Movies by")

      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_1.description)
      expect(page).to have_content(movie_2.title)
      expect(page).to have_content(movie_2.description)
    end
  end
  context "they visit the movies index for a director" do
    it "displays all movies and their information" do
      director = Director.create!(name: 'Wakowski Sisters')
      director_2 = Director.create!(name: 'Spielberg')
      movie_1 = Movie.create!(director_id: director.id, title: "Mary Poppins", description: "Practically perfect in every way")
      movie_2 = Movie.create!(director_id: director_2.id, title: "Goonies", description: "Goonies never say die")

      visit "/directors/#{director.id}/movies"

      expect(page).to have_content("All Movies by #{director.name}")
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_1.description)
      expect(page).to_not have_content(movie_2.title)
    end
  end
end
