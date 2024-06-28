FactoryBot.define do
  factory :review do
    rate { 1 }
    comment { "Best Comment Ever" }
    user
    post
  end
end  