FactoryBot.define do
  factory :disc do
    manufacturer
    sequence(:name) { |n| "Disc #{n}" }
    sequence(:slug) { |n| "disc-#{n}" }
    speed { rand(1..14) }
    glide { rand(1..5) }
    turn { rand(-4..0) }
    fade { rand(0..4) }
  end
end
