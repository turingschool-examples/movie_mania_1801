FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "Movie #{n}" }
    director { Director.first || association(:director) }
  end
end