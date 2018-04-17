# As an unregistered user,
# When I visit the genre index,
# I cannot see the form to create new genres,
# I see all genres (for testing purposes, I should see at least 2)
# and each genre's name should be a link to that genre's specific page

require 'rails_helper'

describe 'As a visitor' do
  context 'when I visit the genres index' do
    before(:all) do
      DatabaseCleaner.clean
      @genres = create_list(:genre, 3)
    end

    after(:all) do
      DatabaseCleaner.clean
    end

    scenario 'I cannot see the create form' do
      visit genres_path

      expect(page).to_not have_xpath('//form')
    end

    scenario 'I can see a list of all genres' do
      visit genres_path

      @genres.each do |genre|
        expect(page).to have_content(genre.name)
      end
    end

    scenario 'I can travel to a specific genre show page' do
      visit genres_path

      genre = @genres.sample
      click_on genre.name

      expect(current_path).to eq(genre_path(genre))
      expect(page).to have_content(genre.name)
    end
  end
end
