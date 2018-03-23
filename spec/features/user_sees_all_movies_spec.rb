require 'rails_helper'

describe "user sees all movies" do
  context "they visit the movies index" do
    it "displays all movies their information" do
      director = Director.create!(name: 'Wakowski Sisters')
      movie_1 = Movie.create!(director_id: director.id, title: "Mary Poppins", description: "Practically perfect in every way")
      movie_2 = Movie.create!(director_id: director.id, title: "Goonies", description: "Goonies never say die")

      visit "/movies"

      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_1.description)
      expect(page).to have_content(movie_2.title)
      expect(page).to have_content(movie_2.description)
    end
  end
end
