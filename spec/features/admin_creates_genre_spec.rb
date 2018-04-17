require 'rails_helper'

describe 'Admin' do
  context 'visits genre index' do
    scenario 'and makes new genre' do
      admin = User.create!(username: "adam", password: '12345', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit genres_path

      fill_in "genre[name]", with: 'Horror'
      click_on 'Submit'

      expect(page).to have_content('Horror')
    end
  end
end
