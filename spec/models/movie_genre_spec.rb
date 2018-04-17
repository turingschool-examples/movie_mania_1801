require "rails_helper"

describe MovieGenre do
  describe "relationships" do
    it {is_expected.to belong_to(:movie)}
    it {is_expected.to belong_to(:genre)}
  end
end
