require 'rails_helper'

describe Genre do
  describe 'relationships' do
    it { should have_many(:movie_genres) }
    it { should have_many(:movies) }
  end
end
