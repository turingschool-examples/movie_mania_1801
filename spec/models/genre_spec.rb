require 'rails_helper'

describe Genre, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many(:genre_movies)}
    it {is_expected.to have_many(:movies).through(:genre_movies)}
  end
end
