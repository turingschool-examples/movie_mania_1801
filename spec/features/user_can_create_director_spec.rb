require 'rails_helper'

describe 'User' do
  context 'creates a new director in a form' do
    it 'should save data correctly' do
      visit new_director_path
      director_name = 'Patty Jenkins'

      fill_in 'director[name]', with: director_name
      click_on 'Create Director'

      expect(page).to have_content(director_name)
    end
  end
end
