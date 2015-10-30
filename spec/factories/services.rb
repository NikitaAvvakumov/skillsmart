FactoryGirl.define do
  factory :service do
    sequence(:name) { |n| "Service area #{n}" }
  end

end
