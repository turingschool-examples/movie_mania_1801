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

  describe "a visitor can link to movie show page" do
    context "to see all the genres for that movie" do
      it "can see multiple genres" do
        director = Director.create!(name: 'Wakowski Sisters')
        movie_1 = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Practically perfect")
        genre_1 = movie_1.genres.create!(name: 'Action')
        genre_2 = movie_1.genres.create!(name: 'Adventure')
        genre_3 = movie_1.genres.create!(name: 'Sci-Fi')

        visit movies_path

        click_link movie_1.title

        expect(current_path).to eq(movie_path(movie_1))

        expect(page).to have_content(movie_1.title)
        expect(page).to have_content(movie_1.description)
        expect(page).to have_content(genre_1.name)
        expect(page).to have_content(genre_2.name)
        expect(page).to have_content(genre_3.name)
      end
    end
  end
end
