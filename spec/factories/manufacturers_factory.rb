FactoryBot.define do
  factory :manufacturer do
    sequence(:name) { |n| "Manufacturer #{n}" }
    sequence(:slug) { |n| "manufacturer-#{n}" }
  end
end
