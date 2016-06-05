# This will guess the Contact class
FactoryGirl.define do
  factory :contact do
    id 1
    name "Paulo"
    email  "paulo@test.com"
    age 20
    state "SC"
    office "Developer"
  end

  factory :contact_two, class: Contact do
    id 1
    name "Roberto"
    email  "Roberto@test.com"
    age 30
    state "São Paulo"
    office "CTO"
  end
end
