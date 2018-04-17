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

    it 'genres link to show pages' do
      genre_1 = Genre.create(name: "Genre_1")
      genre_2 = Genre.create(name: "Genre_2")

      visit genres_path

      click_on "Genre_1"
      expect(current_path).to eq(genre_path(genre_1))
    end
  end
end
