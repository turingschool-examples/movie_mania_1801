require 'rails_helper'

describe Movie, type: :model do
  describe 'validations' do
    it { is_expected.to validate_inclusion_of(:rating).in_array((1..5).to_a) }
  end

  describe 'relationships' do
    it { is_expected.to have_many(:actors).through(:actor_movies) }

    it { is_expected.to have_many(:movie_genres) }
    it { is_expected.to have_many(:genres).through(:movie_genres) }
  end
end
