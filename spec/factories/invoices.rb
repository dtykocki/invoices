FactoryGirl.define do
  factory :invoice do
    sequence(:unique_id) { |n| n }
    sequence(:amount) { |n| n / 1.0 }
    due_date DateTime.now
    status "Draft"
  end
end
