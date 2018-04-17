# As an admin user,
# When I visit the genre index,
# I can see a form to create new genres,
# When I fill out the form with the genre's name,
# And click submit,
# I see a list of genres I have created.

require 'rails_helper'

describe 'As an admin' do
  context 'when I visit the genre index' do
    scenario 'I can see a list of all genres' do
      genre_name = 'A new, better genre'

      visit genre_path

      within('form#genres') do
        fill_in 'genre[name]', with: genre_name
      end
    end
  end
end