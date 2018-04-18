# As an unregistered user,
# When I visit the movie index,
# And I click on "Guardians of the Galaxy"
# I see a page with "Guardians of the Galaxy",
# I also see "Action", "Adventure", "Sci-Fi" under a "Genres for this Movie:" heading
# I also see the rating for this movie (rating 1-5 should be an attribute of a movie).

require 'rails_helper'

describe 'As a visitor' do
  context 'when I visit the movie index' do
    context 'and click on a specific movie' do
      before(:all) do
        @movie = create(:movie)
        @genres = create_list(:genre, 3)
        @genres.each do |genre|
          genre.movies.push(@movie)
        end
      end

      scenario 'I should see this movies name' do
        visit movies_path

        expect(page).to have_content(@movie.title)

        click_on @movie.title

        expect(current_path).to eq(movie_path(@movie))
        expect(page).to have_content(@movie.title)
      end

      scenario 'I should see this movies genres under the proper heading' do
        visit movie_path(@movie)

        expect('Genres for this Movie:').to appear_before(@genres.first.name)

        @genres.each do |genre|
          expect(page).to have_content(genre.name)
        end
      end

      scenario 'I see the rating for this movie' do
        visit movie_path(@movie)

        expect(page).to have_content("Rating: #{@movie.rating}")
      end
    end
  end
end