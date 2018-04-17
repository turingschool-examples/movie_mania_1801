require 'rails_helper'

describe 'As a visitor' do
  context 'when I visit the genre index' do
    it 'I cant create a new genre and I see all genres and link to their show page' do
      genre_1 = Genre.create!(name: 'Action')
      genre_2 = Genre.create!(name: 'Adventure')

      visit genres_path

      expect(page).to_not have_xpath('//form')
      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)

      click_on genre_1.name

      expect(current_path).to eq(genre_path(genre_1))
    end
  end
end
