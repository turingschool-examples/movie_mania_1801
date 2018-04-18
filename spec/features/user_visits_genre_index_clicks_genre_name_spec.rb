require 'rails_helper'

describe 'User visits genres index' do
  context 'clicks on genre name' do
    it 'should show related movies' do
      director = Director.create!(name: 'Someone')
      movie_1 = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Fun space movie", rating: 4)
      genre1 = movie_1.genres.create(name: 'Action')
      movie_2 = genre1.movies.create(director_id: director.id, title: "Suicide Squad", description: "scary space movie", rating: 2)

      visit genres_path

      click_on genre1.name
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
    end

    it 'should show average rating for movies in this genre' do
      director = Director.create!(name: 'Someone')
      movie_1 = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Fun space movie", rating: 4)
      genre1 = movie_1.genres.create(name: 'Action')
      movie_2 = genre1.movies.create(director_id: director.id, title: "Suicide Squad", description: "scary space movie", rating: 1)
      movie_3 = genre1.movies.create(director_id: director.id, title: "Another Sci-Fi Movie", description: "There's some science fiction involved", rating: 4)
      movie_4 = genre1.movies.create(director_id: director.id, title: "Yet Another Sci-Fi Movie", description: "There's some science fiction involved", rating: 4)

      ratings = [movie_1.rating, movie_2.rating, movie_3.rating, movie_4.rating]
      average_rating = ratings.sum / ratings.length
      header = "Average rating for all movies in the genre: #{genre1.name}"

      visit genre_path(genre1)

      expect(page).to have_content(header)
      expect(page).to have_content(average_rating)
    end
  end
end
