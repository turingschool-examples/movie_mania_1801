require 'rails_helper'

describe "admin" do
  scenario "can create a new genre" do
    admin = User.create!(username: "admin", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit genres_path

    fill_in "Name", with: "SciFi"
    click_on "Create Genre"

    expect(page).to have_content("SciFi")
  end
end
