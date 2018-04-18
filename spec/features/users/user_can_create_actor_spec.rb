require 'rails_helper'

describe 'User' do
  context 'creates a new actor in a form' do
    it 'should save data correctly' do
      visit new_actor_path
      actor_name = 'Gal Godot'

      fill_in 'actor[name]', with: actor_name
      click_on 'Create Actor'

      expect(page).to have_content(actor_name)
    end
  end
end
