# As an admin user,
# When I visit the genre index,
# I can see a form to create new genres,
# When I fill out the form with the genre's name,
# And click submit,
# I see a list of genres I have created.

require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    DatabaseCleaner.clean
    @admin = create(:admin)
  end

  after(:each) do
    DatabaseCleaner.clean
  end
  context 'when I visit the genre index' do


    scenario 'I can add a new genre' do
      genre_name = 'A new, better genre'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit genres_path

      expect(page).to_not have_content(genre_name)

      within('form#new_genre') do
        fill_in 'genre[name]', with: genre_name
      end

      click_on 'Create Genre'

      expect(current_path).to eq(genres_path)

      expect(page).to have_content(genre_name)
    end
  end
end