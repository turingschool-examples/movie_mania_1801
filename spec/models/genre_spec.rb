require 'rails_helper'

RSpec.describe Genre, type: :model do
  it { validate_presence_of :name }
end
