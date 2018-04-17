require "rails_helper"

describe "as an unregistered user" do
  scenario "they visit the movies index page" do
    director = Director.create(name: "James Gunn")
    movie = Movie.create(title: "Guardians of the Galaxy", description: "Great Movie", rating: 5, director_id: director.id)
    genre1 = movie.genres.create(title: "Action")
    genre1 = movie.genres.create(title: "Adventure")
    genre1 = movie.genres.create(title: "Sci-Fi")
  end
end
