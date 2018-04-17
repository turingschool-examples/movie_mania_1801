require 'rails_helper'

describe Movie, type: :model do
  describe 'relationships' do
    it 'has many genres' do
      movie = Movie.create(title: 'ksadjhf', description: 'kajsdhfasdf')
      expect(movie).to respond_to(genres)
    end
    it {is_expected.to have_many(:actors).through(:actor_movies)}
  end
end
