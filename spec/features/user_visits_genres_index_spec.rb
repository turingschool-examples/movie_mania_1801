require 'rails_helper'

describe 'unregistered user' do
  describe 'visits genre index' do
    it 'sees all genres' do
      genre1 = Genre.create(name: 'bad stuff')
      genre2 = Genre.create(name: 'good stuff')

      visit genres_path

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
    end
    it 'does not see the form to create genres' do

      visit genres_path

      expect(page).to_not have_content('Create a new genre:')
    end
    it 'sees that genre names are links' do
      genre1 = Genre.create(name: 'bad stuff')
      Genre.create(name: 'good stuff')

      visit genres_path

      expect(page).to have_link('bad stuff')
      expect(page).to have_link('good stuff')

      click_on 'bad stuff'

      expect(current_path).to eq(genre_path(genre1))
    end
  end
end
