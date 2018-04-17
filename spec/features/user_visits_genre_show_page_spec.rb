require 'rails_helper'

describe 'As an unregistered user' do
  describe 'When I visit the genre index' do
    describe 'I can click on action' do
      it 'shows the average rating for movies in this category and movies' do
        director = Director.create!(name: 'Wakowski Sisters')
        movie = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Practically perfect in every way", rating: 5)
        movie2 = Movie.create!(director_id: director.id, title: "Suicide Squad", description: "Practically perfect in every way", rating: 3)
        genre = Genre.create!(name: 'Action')
        genre.movies << movie
        genre.movies << movie2

        visit genres_path
        click_on genre.name

        expect(page).to have_content(movie.title)
        expect(page).to have_content(movie2.title)
      end
    end
  end
end
