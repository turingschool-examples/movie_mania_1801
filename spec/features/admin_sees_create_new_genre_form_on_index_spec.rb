require "rails_helper"

describe "admin" do
  scenario "can see all genres" do
    admin = User.create!(username: "admin", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit genres_path

    fill_in "genre[name]", with: "Horror"
    click_on 'Create Genre'

    expect(page).to have_content("Horror")
  end
end
