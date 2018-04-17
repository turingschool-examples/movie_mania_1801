require "rails_helper"

describe "as an admin" do
  scenario "can see all genres" do
    admin = User.create!(username: "admin", password: "password", role: 1)
    genre1 = Genre.create(title: "Action")
    genre2 = Genre.create(title: "Family")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit genres_path

    expect(page).to have_content(genre1.title)
    expect(page).to have_content(genre2.title)

    fill_in "genre[title]", with: "Cartoon"
    click_on "Create Genre"

    expect(current_path).to eq(genres_path)
    expect(page).to have_content(genre1.title)
    expect(page).to have_content(genre2.title)
    expect(page).to have_content("Cartoon")
  end
end
