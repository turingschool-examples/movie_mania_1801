require 'rails_helper'

describe "unregistered user sees genres associated with movie" do
  context "they visit the movie index and click on a movie title" do
    it "displays all genres which are associated with that movie" do
      director = Director.create!(name: "Someone!")
      movie = director.movies.create!(title: "Guardians of the Galaxy", description: "Owls, maybe?", rating: 3)
      genre1 = movie.genres.create!(name: "Action")
      genre2 = movie.genres.create!(name: "SciFi")
      genre3 = movie.genres.create!(name: "Adventure")

      visit movies_path

      click_on movie.title

      expect(page).to have_content(movie.title)
      expect(page).to have_content("Genres for this Movie:")
      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
      expect(page).to have_content(genre3.name)
      expect(page).to have_content("Movie Rating: #{movie.rating}")
    end
  end
end
