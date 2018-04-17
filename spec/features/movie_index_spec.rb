require "rails_helper"

describe "As a user" do
  describe "When I visit the movie index and click on a movie" do
    scenario "I see genres for the movie" do
      director = Director.create!(name: "Someone")
      movie = director.movies.create!(title: "GoG", description: "Marvel Space", rating: 5)
      genre0 = Genre.create(name: 'action')
      genre1 = Genre.create(name: 'adventure')
      genre2 = Genre.create(name: 'scifi')

      movie.movie_genres.create(genre_id: genre0)
      movie.movie_genres.create(genre_id: genre1)
      movie.movie_genres.create(genre_id: genre2)

      visit movies_path

      click_on 'GoG'

      expect(page).to have_content(genre0.name)
      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
      expect(page).to have_content("Rating: #{movie.rating}")

    end
  end
end
