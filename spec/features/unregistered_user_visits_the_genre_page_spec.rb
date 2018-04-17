require "rails_helper"

describe "as an unregistered user" do
  scenario "they visit the genre index page" do
    genre1 = Genre.create(title: "Action")
    genre2 = Genre.create(title: "Family")

    visit genres_path

    expect(page).to have_content(genre1.title)
    expect(page).to have_content(genre2.title)
    expect(page).to_not have_content("New Genre")

    click_on "Action"
    expect(current_path).to eq(genre_path(genre1))
  end
  scenario "they visit a genre show page" do
    director = Director.create(name: "James Gunn")
    genre1 = Genre.create(title: "Action")
    genre2 = Genre.create(title: "Family")
    movie1 = genre1.movies.create(title: "Guardians of the Galaxy", description: "Good", rating: 5, director_id: director.id)
    movie2 = genre1.movies.create(title: "Suicide Squad", description: "Good", rating: 1, director_id: director.id)
    movie3 = genre2.movies.create(title: "Grand Budapest Hotel", description: "Good", rating: 1, director_id: director.id)

    visit genres_path

    click_on "Action"
    expect(page).to have_content(genre1.title)
    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie2.title)
    expect(page).to have_content("Average Rating: 3")
    expect(page).to_not have_content(movie3.title)
  end
end
