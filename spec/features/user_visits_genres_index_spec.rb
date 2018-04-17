require 'rails_helper'

describe 'Unregistered user' do
  describe 'visits the genres index' do
    it 'does not see a form' do
      visit genres_path

      expect(page).to_not have_content("Create a New Genre")
    end

    it 'sees a list of genres' do
      genre_1 = Genre.create(name: "Genre_1")
      genre_2 = Genre.create(name: "Genre_2")

      visit genres_path

      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
    end
  end
end


# As an unregistered user,
# When I visit the genre index,
# I cannot see the form to create new genres,
# I see all genres (for testing purposes, I should see at least 2)
# and each genre's name should be a link to that genre's specific page
