# As an unregistered user,
# When I visit the genre index,
# And I click on "Action",
# I see a page with the genre's name,
# I see the movie "Guardians of the Galaxy" and "Suicide Squad" listed
# I also see the average rating for movies in this category

require 'rails_helper'

describe 'As a visitor' do
  context 'when I visit the genre index' do
    context 'and I click on a specific genre' do
      before(:all) do
        DatabaseCleaner.clean
        @genre = create(:genre)
        @movies = create_list(:movie, 3, rating: rand(1..5))
        @movies.each do |movie|
          movie.genres.push(@genre)
        end
      end

      after(:all) do
        DatabaseCleaner.clean
      end

      scenario 'I see a page with that genre\'s name' do
        visit genres_path

        click_on @genre.name

        expect(current_path).to eq(genre_path(@genre))
        expect(page).to have_content(@genre.name)
      end

      scenario 'I see the movies for that genre listed' do
        visit genre_path(@genre)

        @movies.each do |movie|
          expect(page).to have_link(movie.title)
        end

        click_on @movies.first.title

        expect(current_path).to eq(movie_path(@movies.first))
      end

      scenario 'I see the average rating for all movies in this category' do
        visit genre_path(@genre)

        expect(page).to have_content("Average rating: #{@genre.avg_rating}")
      end
    end
  end
end