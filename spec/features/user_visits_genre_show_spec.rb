require 'rails_helper'

feature 'Visitor' do
  context 'navigates to genre show page' do
    scenario 'they see movies and average rating for that genre' do
      director = Director.create(name: 'The Coen Brothers')
      guardians = director.movies.create(title: 'Guardians of the Galaxy', description: 'Ragtag space rebels', rating: 4)
      squad = director.movies.create(title: 'Suicide Squad', description: 'Bad at being good', rating: 2)
      genre_one = Genre.create(name: 'Action')
      genre_two = Genre.create(name: 'Adventure')
      genre_three = Genre.create(name: 'Sci-Fi')
      MovieGenre.create(movie: guardians, genre: genre_one)
      MovieGenre.create(movie: guardians, genre: genre_two)
      MovieGenre.create(movie: guardians, genre: genre_three)
      MovieGenre.create(movie: squad, genre: genre_one)
      MovieGenre.create(movie: squad, genre: genre_two)
      MovieGenre.create(movie: squad, genre: genre_three)

      visit genres_path

      click_on 'Action'

      expect(current_path).to eq(genre_path(genre_one))
      expect(page).to have_content(genre_one.name)
      expect(page).to have_content(guardians.title)
      expect(page).to have_content(squad.title)

      expect(page).to have_content('Average Rating: 3')
    end
  end
end
