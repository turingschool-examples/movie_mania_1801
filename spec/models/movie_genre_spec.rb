require 'rails_helper'

describe MovieGenre, type: :model do
  it { is_expected.to belong_to(:movie) }
  it { is_expected.to belong_to(:genre) }
end
