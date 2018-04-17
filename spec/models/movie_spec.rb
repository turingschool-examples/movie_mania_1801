require 'rails_helper'

describe Movie, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:actors).through(:actor_movies)}
    it { should have_many(:movie_genres) }
    it { should have_many(:genres) }
 end
end
