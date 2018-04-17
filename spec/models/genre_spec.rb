require 'rails_helper'

describe Genre, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should have_many(:movies) }
  end
end
