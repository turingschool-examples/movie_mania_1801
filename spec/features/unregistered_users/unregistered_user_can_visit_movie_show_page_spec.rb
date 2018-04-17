require 'rails_helper'

describe "As an unregistered user" do
  describe "I visit the movie index" do
    describe "I click on 'Guardians of the Galaxy'" do
      describe "I can see the show page for that movie" do
        scenario "I also see 'Action', 'Adventure', 'Sci-Fi' under 'Genres for this Movie:' heading along with rating for the movie" do
          director = Director.create!(name: "Someone!")
          movie_1 = director.movies.create!(title: 'Guardians of the Galaxy', description: 'Stupid Movie', rating: 2)
          movie_2 = director.movies.create!(title: 'Hannibal', description: 'Awesome Movie', rating: 5)
          genre_1 = movie_1.genres.create!(name: 'Action')
          genre_2 = movie_1.genres.create!(name: 'Adventure')
          genre_3 = movie_1.genres.create!(name: 'Sci-Fi')

          visit movies_path

          click_on movie_1.title

          expect(current_path).to eq(movie_path(movie_1))
          expect(page).to have_content('Genres for this Movie:')
          expect(page).to have_content(genre_1.name)
          expect(page).to have_content(genre_2.name)
          expect(page).to have_content(genre_3.name)
          expect(page).to have_content(movie_1.rating)
        end
      end
    end
  end
end
