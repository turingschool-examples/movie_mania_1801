require 'rails_helper'

describe "As an visitor" do
  context "they visit the genre index" do
    it "to link to a genre show page and see genre name" do
      genre1 = Genre.create!(name: 'Action')
      genre2 = Genre.create!(name: 'Horror')
      genre3 = Genre.create!(name: 'Romance')

      visit genres_path

      click_link genre1.name

      expect(current_path).to eq(genre_path(genre1))
      expect(page).to have_content(genre1.name)
    end
  end

  context "they visit the genre index" do
    it "and link to a specific genre to see associated movies and rating" do
      director = Director.create!(name: 'Keller Man')
      genre_1 = Genre.create!(name: 'Action')
      movie_1 = genre_1.movies.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Practically ridiculous", rating: 4)
      movie_2 = genre_1.movies.create!(director_id: director.id, title: "Suicide Squad", description: "Nonsense", rating: 2)

      visit genres_path

      click_link genre_1.name

      expect(current_path).to eq(genre_path(genre_1))
      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
      expect(page).to have_content("Average Rating for this Genre: #{genre_1.average_movie_rating}")
    end
  end
end
