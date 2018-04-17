require 'rails_helper'

describe 'As an unregistered user' do
  describe 'When I visit the movie index' do
    describe 'And I click on Guardians of the Galaxy' do
      it 'shows me genre info and rating' do
        director = Director.create!(name: 'Wakowski Sisters')
        movie = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Practically perfect in every way")
        movie.genres.create!(name: 'Action')
        movie.genres.create!(name: 'Adventure')
        movie.genres.create!(name: 'Sci-Fi')
        visit movies_path
        click_on movie.title

        expect(page).to have_content(movie.title)
        expect(page).to have_content(movie.genres.first)
        expect(page).to have_content(movie.genres.second)
        expect(page).to have_content(movie.genres.third)
        expect(page).to have_content(movie.rating)
      end
    end
  end
end
