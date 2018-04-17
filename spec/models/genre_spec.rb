require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to have_many(:movies).through(:movie_genres)}
  end
end
