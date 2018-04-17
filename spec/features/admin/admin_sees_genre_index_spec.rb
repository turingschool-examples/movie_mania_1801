require "rails_helper"

describe "admin" do
  scenario "can see all genres" do
    admin = User.create!(username: "admin", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_genres_path

    expect(page).to have_content("Admin Genres")
  end
end

describe "default" do
  scenario "cannot see all genres" do
    reg_user = User.create!(username: "reg", password: "pass", role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(reg_user)

    visit admin_genres_path

    expect(page).to_not have_content("Admin Genres")
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
