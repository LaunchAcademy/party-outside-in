require 'factory_bot'

FactoryBot.define do
  factory :party do
    sequence(:name){ |i| "Party #{i}"}
    location "Boston, MA"
    description "Party Time!"
  end
end
