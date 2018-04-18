require "rails_helper"

describe "As a non admin or default user" do
  scenario "I cannot see the form to create new genres on the  genre index, but can see the existing genres" do
    genre_1 = Genre.create!(name: 'Action')
    genre_2 = Genre.create!(name: 'Adventure')
    genre_3 = Genre.create!(name: 'Sci-fi')

    visit genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
    expect(page).to have_content(genre_3.name)
    expect(page).to_not have_xpath('//form')

    click_on genre_2.name

    expect(current_path).to eq(genre_path(genre_2))
  end
end
