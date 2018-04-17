require 'rails_helper'

describe "As an admin" do
  context "they visit the genre index" do
    it "and fill in a form to create a new genre" do
      genre1 = Genre.create!(name: 'Action')
      genre2 = Genre.create!(name: 'Horror')
      genre3 = Genre.create!(name: 'Romance')

      visit genres_path

      expect(current_path).to eq(genres_path)

      assert has_no_field?(:name)

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
      expect(page).to have_content(genre3.name)
    end
  end

  context "they visit the genre index" do
    it "and fill in a form to create a new genre" do
      genre1 = Genre.create!(name: 'Action')
      genre2 = Genre.create!(name: 'Horror')
      genre3 = Genre.create!(name: 'Romance')

      visit genres_path

      click_link genre1.name

      expect(current_path).to eq(genre_path(genre1))
      expect(page).to have_content(genre1.name)
    end
  end
end
