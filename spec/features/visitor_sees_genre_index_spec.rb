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
    MovieGenre.create!(movie_id: movie1.id, genre_id: genre1.id)
    MovieGenre.create!(movie_id: movie1.id, genre_id: genre2.id)
    MovieGenre.create!(movie_id: movie1.id, genre_id: genre3.id)

    visit movies_path
    click_on movie1.title

    expect(current_path).to eq(movie_path(movie1))
    expect(page).to have_content(movie1.title)
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
    expect(page).to have_content(genre3.name)
    expect(page).to have_content(movie1.rating)
  end
  scenario "can go to genre show page and see all movies with that genre" do
    genre1 = Genre.create!(name: "Action")
    genre2 = Genre.create!(name: "Thriller")
    director = Director.create!(name: 'Wakowski Sisters')
    movie1 = Movie.create!(director_id: director.id, title: "Guardians of the Galaxy", description: "Practically perfect in every way", rating: 5)
    movie2 = Movie.create!(director_id: director.id, title: "Suicide Squad", description: "Practically perfect in every way", rating: 15)
    movie3 = Movie.create!(director_id: director.id, title: "Suicide Squad", description: "Practically perfect in every way", rating: 10000)
    MovieGenre.create!(movie_id: movie1.id, genre_id: genre1.id)
    MovieGenre.create!(movie_id: movie2.id, genre_id: genre1.id)
    MovieGenre.create!(movie_id: movie3.id, genre_id: genre2.id)
    average = (movie1.rating + movie2.rating) / 2

    visit genres_path
    click_on genre1.name

    expect(current_path).to eq(genre_path(genre1))
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie2.title)
    expect(page).to have_content("Average rating: #{average}")
  end
end
