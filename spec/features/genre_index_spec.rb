require "rails_helper"

describe "admin" do
  describe "When I visit the genre index" do
    scenario "I can see a form to create new genres" do
      admin = User.create!(username: "admin", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      fill_in 'genre[name]', with: 'action'

      click_on 'Create Genre'

      expect(page).to have_content("action")
    end
    scenario "I can't submit a blank genre" do
      admin = User.create!(username: "admin", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      fill_in 'genre[name]', with: ''

      click_on 'Create Genre'

      expect(page).to have_content("Problem creating genre!")
    end
  end
end

describe "unregistered user" do
  describe "When I visit the genre index" do
    scenario "I see list of genres but no form" do
      genre0 = Genre.create!(name: 'romance')
      genre1 = Genre.create!(name: 'comedy')
      genre2 = Genre.create!(name: 'scifi')
      visit genres_path

      expect(page).to_not have_content("Create Genre")
      expect(page).to have_content(genre0.name)
      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)

      click_on 'romance'

      expect(current_path).to eq(genre_path(genre0))
    end
    describe "I click on a genre" do
      scenario "I see the movies in the genre" do
        genre = Genre.create!(name: 'romance')
        director = Director.create!(name: "Someone")
        movie = director.movies.create!(title: "GoG", description: "Marvel Space", rating: 5)
        movie1 = director.movies.create!(title: "Ironman", description: "Metal Suit Dude", rating: 3)
        movie2 = director.movies.create!(title: "Thor", description: "Hammer Dude", rating: 4)

        movie.genre_movies.create(genre_id: genre)
        movie1.genre_movies.create(genre_id: genre)
        movie2.genre_movies.create(genre_id: genre)

        visit genres_path

        click_on 'romance'

        expect(page).to have_content(movie.title)
        expect(page).to have_content(movie1.title)
        expect(page).to have_content(movie2.title)

      end
      scenario "I see the average rating" do
        genre = Genre.create!(name: 'romance')
        director = Director.create!(name: "Someone")
        movie = director.movies.create!(title: "GoG", description: "Marvel Space", rating: 5)
        movie1 = director.movies.create!(title: "Ironman", description: "Metal Suit Dude", rating: 3)
        movie2 = director.movies.create!(title: "Thor", description: "Hammer Dude", rating: 4)

        movie.genre_movies.create(genre_id: genre)
        movie1.genre_movies.create(genre_id: genre)
        movie2.genre_movies.create(genre_id: genre)

        visit genres_path

        click_on 'romance'

        expect(page).to have_content("Average Rating: 4")
      end
    end
  end
end
