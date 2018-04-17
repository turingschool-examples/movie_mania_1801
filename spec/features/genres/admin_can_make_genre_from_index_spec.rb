require 'rails_helper'

context 'An Admin' do
  context 'visits the index' do
    scenario 'they can make a new genre' do
      admin = User.create!(username: 'user', password: 'pass', role: 'admin')

      visit genres_path

      expect(page).to_not have_content('Smashmouth')

      fill_in 'genre[name]', with: 'Smashmouth'
      click_on 'Create Genre'

      expect(current_path).to eq(genres_path)
      expect(page).to have_content('Smashmouth')
      expect(Genre.all.size).to eq(1)
    end
  end
end