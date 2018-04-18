require 'rails_helper'

describe Genre, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:movies).through(:movie_genres)}
  end

  describe 'validates' do
    it { validate_presence_of :name }
  end
end
