require 'rails_helper'

describe Actor, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:name)}
  end
  describe 'relationships' do
    it {is_expected.to have_many(:movies).through(:actor_movies)}
  end
end
