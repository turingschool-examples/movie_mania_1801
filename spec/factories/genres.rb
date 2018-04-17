FactoryBot.define do
  factory :order do
    sequence(:name) { |n| "Genre #{n}" }
  end
end