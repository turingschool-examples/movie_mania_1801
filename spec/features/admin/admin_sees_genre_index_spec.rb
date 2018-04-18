require "rails_helper"

describe "admin" do
  scenario "can see 'Admin Genres' heading" do
    admin = User.create!(username: "admin", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_genres_path

    expect(page).to have_content("Admin Genres")
  end
end
