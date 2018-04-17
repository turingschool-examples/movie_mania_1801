FactoryBot.define do
  factory :director do
    sequence(:name) { |n| "Director #{n}" }
  end
end
