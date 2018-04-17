require "rails_helper"

describe "as an unregistered user" do
  scenario "they visit the movies index page" do
    director = Director.create!(name: "James Gunn")
    movie = Movie.create!(title: "Guardians of the Galaxy", description: "Great Movie", rating: 5, director_id: director.id)
    genre1 = movie.genres.create!(title: "Action")
    genre2 = movie.genres.create!(title: "Adventure")
    genre3 = movie.genres.create!(title: "Sci-Fi")

    visit movies_path
    click_on "Guardians of the Galaxy"

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.rating)
    expect(page).to have_content("Genres for this Movie: #{genre1.title}, #{genre2.title}, #{genre3.title}")
  end
end
