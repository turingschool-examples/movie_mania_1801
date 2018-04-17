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
end
