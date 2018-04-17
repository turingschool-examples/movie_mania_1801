# As an unregistered user,
# When I visit the genre index,
# I cannot see the form to create new genres,
# I see all genres (for testing purposes, I should see at least 2)
# and each genre's name should be a link to that genre's specific page

require 'rails_helper'

describe 'As a visitor' do
  context 'when I visit the genres index' do
    scenario 'I cannot see the create form' do
      visit genres_path

      expect(page).to_not have_xpath('//form')
    end
  end
end
