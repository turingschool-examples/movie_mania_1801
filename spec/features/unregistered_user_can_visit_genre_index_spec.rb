require 'rails_helper'

describe "As an unregistered user" do
  describe "I visit the genre index" do
    describe "I cannot see the form to create new genres" do
      describe "I can see all the genres" do
        scenario "Each genres name should be a link to that genre\'s specific show page" do
          genre_1 = Genre.create!(name: 'Horror')
          genre_2 = Genre.create!(name: 'Action')
          genre_3 = Genre.create!(name: 'Romance')

          visit genres_path
          
          expect(page).to_not have_content('Add a Genre')
          expect(page).to have_content(genre_1.name)
          expect(page).to have_content(genre_2.name)
          expect(page).to have_content(genre_3.name)
          expect(page).to have_link(genre_1.name)
          expect(page).to have_link(genre_2.name)
          expect(page).to have_link(genre_3.name)
          expect(page).to_not have_content('Create a Genre')
        end

        scenario "I can visit the show page for each genre" do
          genre_1 = Genre.create!(name: 'Horror')
          genre_2 = Genre.create!(name: 'Action')
          genre_3 = Genre.create!(name: 'Romance')

          visit genres_path

          click_on genre_1.name

          expect(current_path).to eq(genre_path(genre_1))
          expect(page).to have_content(genre_1.name)
          expect(page).to_not have_content(genre_2.name)
          expect(page).to_not have_content('Create a Genre')
        end
      end
    end
  end
end
