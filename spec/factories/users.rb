FactoryBot.define do
  factory :user do
    sequence(:login) { |n| "User #{n}" }
    name { "Tartar" }
    url { "MyString" }
    avatar_url { "MyString" }
    provider { "MyString" }
  end
end
