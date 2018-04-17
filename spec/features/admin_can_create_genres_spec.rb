require 'rails_helper'

describe 'Admin user' do
  context 'visits genres index' do
    it 'should be able to click on link to create genres' do
      visit genres_path

      expect(page).to have_content('Create New Genres Here')

      fill_in 'Name', with: 'Action'
      click_on 'Create Genre'

      expect(current_path).to eq(genres_path)
      expect(page).to have_content('Action')
    end
  end
end
