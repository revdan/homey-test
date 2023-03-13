FactoryBot.define do
  factory :user do
    name { "John Doe" }
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password { "password" }
    password_confirmation { "password" }
  end
end
