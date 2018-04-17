require 'rails_helper'

describe 'unregistered user' do
  describe 'visits genre index' do
    it 'sees all genres' do
      user = User.create(username: 'name', password: 'password', role: 'default')
      genre1 = Genre.create(name: 'bad stuff')
      genre2 = Genre.create(name: 'good stuff')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit genres_path

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
    end
    it 'does not see the form to create genres' do
      user = User.create(username: 'name', password: 'password', role: 'default')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit genres_path

      expect(page).to_not have_content('Create a new genre:')
    end
  end
end
