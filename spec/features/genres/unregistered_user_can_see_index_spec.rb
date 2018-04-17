require 'rails_helper'

context 'an unregistered visitor' do
  context 'visits the index' do
    scenario 'they see all genres with links' do
      g1 = Genre.create(name: 'Smashmouth')
      g2 = Genre.create(name: 'All Star')

      visit genres_path

      expect(page).to have_link(g1.name)
      expect(page).to have_link(g2.name)
      expect(page).to_not have_content('Create Genre')
    end
  end
end