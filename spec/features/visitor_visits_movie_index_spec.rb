require 'rails_helper'

describe 'Visitor' do
  scenario 'visits the movie index' do
    director = Director.create!(name: 'Who Cares')
    movie    = Movie.create!(title: 'Guardians of the Galaxy', description: 'Bad movie', director_id: director.id, rating: 1)
    genre_1  = Genre.create!(name: 'Action')
    genre_2  = Genre.create!(name: 'Adventure')
    genre_3  = Genre.create!(name: 'Sci-Fi')
    genres   = [genre_1, genre_2, genre_3]
    MovieGenre.create!(movie_id: movie.id, genre_id: genre_1.id)
    MovieGenre.create!(movie_id: movie.id, genre_id: genre_2.id)
    MovieGenre.create!(movie_id: movie.id, genre_id: genre_3.id)

    visit movies_path
    within (".movie-#{movie.id}") do
      click_on movie.title
    end

    expect(page).to have_content(movie.title)
    expect(page).to have_content('Genres for this Movie:')
    genres.each do |genre|
      expect(page).to have_content(genre.name)
    end
    expect(page).to have_content("rating: #{movie.rating}")
  end
end
