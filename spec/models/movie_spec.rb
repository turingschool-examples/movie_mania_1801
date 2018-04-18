require 'rails_helper'

describe Movie, type: :model do
  describe 'validations' do
    it { validate_presence_of :director_id }
    it { validate_presence_of :title }
    it { validate_presence_of :description }
    it { validate_presence_of :rating }
  end
  describe 'relationships' do
    it {is_expected.to have_many(:actors).through(:actor_movies)}
    it { should have_many(:movie_genres) }
    it { should have_many(:genres) }
 end
end
