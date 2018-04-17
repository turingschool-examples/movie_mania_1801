require 'rails_helper'

describe "As an unregistered user" do
  describe "I visit the genre index" do
    describe "I cannot see the form to create new genres" do
      describe "I can see all the genres" do
        scenario "Each genres name should be a link to that genre\'s specific show page" do
          genre_1 = Genre.create!(name: 'Horror')
          genre_2 = Genre.create!(name: 'Action')
          genre_3 = Genre.create!(name: 'Romance')

          visit genres_path

          expect(page).to_not have_content('Add a Genre')
          expect(page).to have_content(genre_1.name)
          expect(page).to have_content(genre_2.name)
          expect(page).to have_content(genre_3.name)
          expect(page).to have_link(genre_1.name)
          expect(page).to have_link(genre_2.name)
          expect(page).to have_link(genre_3.name)
          expect(page).to_not have_content('Create a Genre')
        end

        scenario "I can visit the show page for each genre" do
          director = Director.create!(name: "Someone!")
          movie_1 = director.movies.create!(title: 'Guardians of the Galaxy', description: 'Stupid Movie', rating: 2)
          movie_2 = director.movies.create!(title: 'Suicide Squad', description: 'Awesome Movie', rating: 5)
          genre_1 = movie_1.genres.create!(name: 'Action')
          genre_2 = movie_1.genres.create!(name: 'Adventure')
          genre_3 = movie_1.genres.create!(name: 'Sci-Fi')

          visit genres_path

          click_on genre_1.name

          expect(current_path).to eq(genre_path(genre_1))
          expect(page).to have_content(genre_1.name)
          expect(page).to_not have_content(genre_2.name)
          expect(page).to_not have_content('Create a Genre')
        end

        scenario "I can visit the show page for each genre and see the movies listed for that genre" do
          director = Director.create!(name: "Someone!")
          movie_1 = director.movies.create!(title: 'Guardians of the Galaxy', description: 'Stupid Movie', rating: 1)
          movie_2 = director.movies.create!(title: 'Suicide Squad', description: 'Awesome Movie', rating: 5)
          genre_1 = Genre.create!(name: 'Action')
          genre_2 = Genre.create!(name: 'Adventure')
          MovieGenre.create!(movie: movie_1, genre: genre_1)
          MovieGenre.create!(movie: movie_2, genre: genre_1)

          visit genres_path

          click_on genre_1.name

          expect(current_path).to eq(genre_path(genre_1))
          expect(page).to have_content(genre_1.name)
          expect(page).to have_content(movie_1.title)
          expect(page).to have_content(movie_2.title)
          expect(page).to have_content('Average Rating: 3')
          expect(page).to_not have_content(genre_2.name)
        end
      end
    end
  end
end
