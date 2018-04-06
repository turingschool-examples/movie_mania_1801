require "rails_helper"

describe "admin" do
  scenario "can see all categories" do
    admin = User.create!(username: "admin", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path

    expect(page).to have_content("Admin Categories")
  end
end

describe "default" do
  scenario "cannot see all categories" do
    reg_user = User.create!(username: "reg", password: "pass", role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(reg_user)

    visit admin_categories_path

    expect(page).to_not have_content("Admin Categories")
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
