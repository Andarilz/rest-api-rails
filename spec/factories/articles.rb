FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Sample article #{n}" }
    content { "Sample content" }
    sequence(:slag) { |n| "Sample-slag-#{n}" }
  end
end
