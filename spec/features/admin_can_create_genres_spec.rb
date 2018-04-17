require 'rails_helper'

describe 'Admin user' do
  context 'visits genres index' do
    it 'should be able to click on link to create genres' do
      admin = User.create(username: 'admin1', password: 'admin', role: 'admin')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      genre_name = 'Action'
      flash_success = "SUCCESS: You created new genre: #{genre_name}"

      fill_in 'Name', with: genre_name
      click_on 'Create Genre'

      expect(current_path).to eq(genres_path)
      expect(page).to have_content(genre_name)
      expect(page).to have_content(flash_success)
    end

    it 'should give a flash message if it fails to create a genre' do
      admin = User.create(username: 'admin1', password: 'admin', role: 'admin')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      flash_failure = 'ERROR: Unable to create new genre.'

      fill_in 'Name', with: nil
      click_on 'Create Genre'

      expect(current_path).to eq(genres_path)
      expect(page).to have_content(flash_failure)
    end
  end
end
