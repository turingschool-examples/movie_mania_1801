require "rails_helper"

describe "visitor" do
  scenario "can see all genres but not form for creating" do
    genre1 = Genre.create!(name: "Horror")
    genre2 = Genre.create!(name: "Thriller")
    genre3 = Genre.create!(name: "Suspense")

    visit genres_path

    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
    expect(page).to have_content(genre3.name)
    expect(page).to_not have_selector(:button, 'Create Genre')
  end
  scenario "can see genres for individual movie" do
    director = Director.create!(name: 'Wakowski Sisters')
    genre1 = Genre.create!(name: "Horror")
    genre2 = Genre.create!(name: "Thriller")
    genre3 = Genre.create!(name: "Suspense")
    movie1 = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Practically perfect in every way", rating: 5)

    visit movies_path
    click_on movie1.title

    expect(current_path).to eq(movie_path(movie1))
    expect(page).to have_content(movie1.title)
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
    expect(page).to have_content(genre3.name)
    expect(page).to have_content(movie1.rating)
  end
end
