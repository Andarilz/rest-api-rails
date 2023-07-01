FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Sample article #{n}" }
    content { "Sample content" }
    sequence(:slug) { |n| "Sample-slug-#{n}" }
  end
end
