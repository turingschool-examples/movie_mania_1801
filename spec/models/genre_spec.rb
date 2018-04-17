require 'rails_helper'

describe Genre, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to have_many(:movie_genres) }
  it { is_expected.to have_many(:movies).through(:movie_genres) }
end