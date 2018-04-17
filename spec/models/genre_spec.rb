require 'rails_helper'

describe Genre, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it {is_expected.to have_many(:movies).through(:movie_genres)}
  end
end
