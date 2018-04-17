require "rails_helper"

describe "visitor" do
  scenario "can see all genres but not form for creating" do
    genre1 = Genre.create!(name: "Horror")
    genre2 = Genre.create!(name: "Thriller")
    genre3 = Genre.create!(name: "Suspense")

    visit genres_path
    save_and_open_page

    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
    expect(page).to have_content(genre3.name)
    expect(page).to_not have_selector(:button, 'Create Genre')
  end
end
