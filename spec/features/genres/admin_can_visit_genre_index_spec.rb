require 'rails_helper'

describe "As an admin" do
  context "they visit the genre index" do
    it "and fill in a form to create a new genre" do
      visit genres_path

      fill_in 'genre[name]', with: 'Action'
      click_on 'Create Genre'

      expect(current_path).to eq(genres_path)
      expect(page).to have_content(Genre.last.name)
    end
  end
end
