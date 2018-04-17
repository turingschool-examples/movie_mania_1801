require 'rails_helper'

describe 'Admin user' do
  context 'visits genres index' do
    it 'should be able to click on link to create genres' do
      admin = User.create(username: 'admin1', password: 'admin', role: 'admin')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      click_on 'Create New Genres Here'

      fill_in 'Name', with: 'Action'
      click_on 'Create Genre'

      expect(current_path).to eq(genres_path)
      expect(page).to have_content('Action')
    end
  end
end
