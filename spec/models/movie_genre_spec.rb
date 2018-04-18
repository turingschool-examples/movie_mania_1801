require 'rails_helper'

describe MovieGenre do
  describe 'relationships' do
    it { should belong_to(:genre)}
    it { should belong_to(:movie)}
  end

end
