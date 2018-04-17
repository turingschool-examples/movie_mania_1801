FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "Movie #{n}" }
    director { Director.first || association(:director) }
    rating { rand(1..5) }
  end
end