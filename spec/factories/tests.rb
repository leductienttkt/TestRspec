FactoryGirl.define do
  factory :test do
    name { Faker::Name.name }
    score 10
  end
end
