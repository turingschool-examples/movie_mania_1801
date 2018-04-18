require 'rails_helper'

describe "As an visitor" do
  context "they visit the genre index" do
    it "and and do not see a form but see the genre names" do
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
end
