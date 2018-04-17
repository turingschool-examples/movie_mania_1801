require 'rails_helper'

describe 'As a visitor' do
  context 'when I visit a genre show page' do
    it 'I see the genre name, all associated movies, and the avg ratings for these movies' do
      genre = Genre.create!(name: 'Action')
      director = Director.create!(name: 'Ian Douglas')
      movie_1 = genre.movies.create!(title: 'Guardians of the Galaxy', description: 'Chris Pratt rules', rating: 5, director_id: director.id)
      movie_2 = genre.movies.create!(title: 'Suicide Squad', description: 'More comic book funz', rating: 1, director_id: director.id)
      movie_3 = Movie.create!(title: 'Love Actually', description: 'not action!', director_id: director.id)

      visit genres_path

      click_on genre.name

      expect(current_path).to eq(genre_path(genre))
      expect(page).to have_content(genre.name)
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
      expect(page).to_not have_content(movie_3.title)
      expect(page).to have_content("Average Movie Rating: #{genre.average_rating}")
    end
  end
end
