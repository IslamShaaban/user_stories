FactoryBot.define do
  factory :post do
    title { "Sample Post" }
    body { "Lorem ipsum dolor sit amet, consectetur adipiscing elit." }
    user
  end
end