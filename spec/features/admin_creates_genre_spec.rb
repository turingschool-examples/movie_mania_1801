require 'rails_helper'

describe 'Admin' do
  context 'visits genre index' do
    scenario 'and makes new genre' do
      admin = User.create!(username: "adam", password: '12345', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_genres_path

      fill_in "genre[name]", with: 'Horror'
      click_on 'submit'

      expect(page).to have_content('Horror')
    end
    scenario 'can\'t do it if not admin' do
      user = User.create!(username: "adam", password: '12345', role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_genres_path

      expect(page).to have_content('404')
    end
  end
end
