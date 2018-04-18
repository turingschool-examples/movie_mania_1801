require "rails_helper"

describe "Non admins or default users" do
  scenario "cannot see the form to create new genres" do

    visit genres_path

    expect(page).to_not have_content("Admin Genres")
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
