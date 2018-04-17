require 'rails_helper'

describe 'Visitor' do
  context 'visits the genre index' do
    scenario 'and cannot see form for new genre' do
      genre_1 = Genre.create!(name: "classic")
      genre_2 = Genre.create!(name: "horror")
      genre_3 = Genre.create!(name: "western")
      visit genres_path

      expect(page).to_not have_button("submit")
      expect(page).to have_link(genre_1.name)
      expect(page).to have_link(genre_2.name)
      expect(page).to have_link(genre_3.name)
    end
  end
end
