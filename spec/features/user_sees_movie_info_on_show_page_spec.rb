require 'rails_helper'

describe "user goes to movies index" do
  context "they click a movie name" do
    it "displays genres for movie and movie rating" do
      director = Director.create!(name: 'Someone')
      movie_1 = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Fun space movie", rating: 4)
      genre1 = movie_1.genres.create(name: 'Action')
      genre2 = movie_1.genres.create(name: 'Adventure')
      genre3 = movie_1.genres.create(name: 'Sci-Fi')

      visit movies_path

      header = 'Genres for this movie:'

      click_on movie_1.title

      expect(current_path).to eq(movie_path(movie_1))
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_1.description)
      expect(page).to have_content(movie_1.rating)
      expect(page).to have_content(header)
      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
      expect(page).to have_content(genre3.name)
    end
  end
end
