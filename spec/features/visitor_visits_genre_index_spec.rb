require 'rails_helper'

describe 'Visitor' do
  context 'visits the genre index' do
    scenario 'and cannot see form for new genre' do
      genre_1 = Genre.create!(name: 'classic')
      genre_2 = Genre.create!(name: 'horror')
      genre_3 = Genre.create!(name: 'western')
      visit genres_path

      expect(page).to_not have_button('submit')
      expect(page).to have_link(genre_1.name)
      expect(page).to have_link(genre_2.name)
      expect(page).to have_link(genre_3.name)
    end
    scenario 'and clicks on genre\'s name' do
      director = Director.create!(name: 'big shot')
      genre = Genre.create!(name: 'Action')
      movie_1 = Movie.create!(title: 'Guardians of the Galaxy', description: 'Garbage', director_id: director.id, rating: 2)
      movie_2 = Movie.create!(title: 'Suicide Squad', description: 'Better garbage', director_id: director.id, rating: 4)
      movie_genre_1 = MovieGenre.create!(movie_id: movie_1.id, genre_id: genre.id)
      movie_genre_2 = MovieGenre.create!(movie_id: movie_2.id, genre_id: genre.id)

      visit genres_path
      click_on genre.name

      expect(page).to have_content(genre.name)
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
      expect(page).to have_content("Average rating for this genre: #{genre.avg_rating}")
    end
  end
end
