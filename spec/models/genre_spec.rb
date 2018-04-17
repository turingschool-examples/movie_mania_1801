require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'validations' do
    it { validate_presence_of :name }
  end

  describe 'relationships' do
   it { should have_many(:movie_genres) }
   it { should have_many(:movies) }
 end
end
