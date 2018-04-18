require 'rails_helper'

describe "admin" do
  it "can create a new genre if genre name is given" do
    admin = User.create!(username: "admin", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit genres_path

    fill_in "Name", with: "SciFi"
    click_on "Create Genre"

    expect(page).to have_content("SciFi")
  end

  it "cannot create a new genre if genre name is missing" do
    admin = User.create!(username: "admin", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit genres_path

    click_on "Create Genre"

    expect(page).to have_content("Your genre was not successfully created.")
  end
end
