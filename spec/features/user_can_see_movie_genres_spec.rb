require 'rails_helper'

feature 'Visitor' do
  context 'navigates to movie show page' do
    scenario 'they see the information for that movie' do
      director = Director.create(name: 'The Coen Brothers')
      movie = director.movies.create(title: 'Guardians of the Galaxy', description: 'Ragtag space rebels')

      visit movies_path

      click_on 'Guardians of the Galaxy'

      expect(current_path).to eq(movie_path(movie))
      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie.description)
    end

    scenario 'they see the genres for that movie' do
      director = Director.create(name: 'The Coen Brothers')
      movie = director.movies.create(title: 'Guardians of the Galaxy', description: 'Ragtag space rebels')

      visit movie_path(movie)


    end

    scenario 'they see the rating for that movie' do
    end
  end
end
