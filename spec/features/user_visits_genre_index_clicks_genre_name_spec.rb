require 'rails_helper'

describe 'User visits genres index' do
  context 'clicks on genre name' do
    it 'should show related movies' do
      director = Director.create!(name: 'Someone')
      movie_1 = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Fun space movie", rating: 4)
      genre1 = movie_1.genres.create(name: 'Action')
      movie_2 = genre1.movies.create(director_id: director.id, title: "Suicide Squad", description: "scary space movie", rating: 2)

      visit genres_path

      click_on 'Action'
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
    end
  end
end
