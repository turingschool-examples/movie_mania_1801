require 'rails_helper'

describe "user goes to movies index" do
  context "they click a movie name" do
    it "displays genres for movie and movie rating" do
      director = Director.create!(name: 'Someone')
      movie_1 = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Fun space movie", rating: 4)

      visit movies_path

      click_on 'Guardians of the Galaxy'

      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_1.description)
      expect(page).to have_content(movie_1.rating)
      expect(page).to have_content('Genres for this movie:')
      expect(page).to have_content('Action')
      expect(page).to have_content('Adventure')
      expect(page).to have_content('Sci-Fi')
    end
  end
end
