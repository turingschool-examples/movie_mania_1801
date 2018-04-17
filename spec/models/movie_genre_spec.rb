require 'rails_helper'

describe MovieGenre, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:movies)}
    it {is_expected.to have_many(:genres)}
  end
end
