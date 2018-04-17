require 'rails_helper'

describe Movie, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:actors).through(:actor_movies)}
    it {is_expected.to have_many(:genres).through(:movie_genres)}
  end
end
