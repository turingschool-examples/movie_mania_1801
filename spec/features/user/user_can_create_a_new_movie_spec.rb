require 'rails_helper'

describe 'User' do
  context 'adding a movie through a form' do
    it 'should save the data properly and appear on the show page' do
      director = Director.create(name: 'Patty Jenkins')
      visit "/directors/#{director.id}/movies/new"
      title = 'Wonder Woman'
      description = 'Before she was Wonder Woman, she was Diana.'

      fill_in :movie_title, with: title
      fill_in :movie_description, with: description

      click_on 'Create Movie'

      expect(page).to have_content(title)
      expect(page).to have_content(description)
      expect(page).to have_content(director.name)
      expect(current_path).to eq("/movies/#{Movie.last.id}")
    end
  end

  context 'adding a movie through a form with a rating' do
    it 'should save the data properly and appear on the show page' do
      director = Director.create(name: 'Patty Jenkins')
      visit "/directors/#{director.id}/movies/new"
      title = 'Wonder Woman'
      description = 'Before she was Wonder Woman, she was Diana.'
      rating = 5

      fill_in :movie_title, with: title
      fill_in :movie_description, with: description
      fill_in :movie_rating, with: rating

      click_on 'Create Movie'

      expect(page).to have_content(title)
      expect(page).to have_content(description)
      expect(page).to have_content(director.name)
      expect(page).to have_content("Rating: #{rating}")
      expect(current_path).to eq("/movies/#{Movie.last.id}")
    end
  end
end
