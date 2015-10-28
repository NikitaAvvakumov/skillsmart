FactoryGirl.define do
  factory :customer do
    first_name { FactoryHelper::Name.first_name }
    last_name { FactoryHelper::Name.last_name }
    sequence(:email) do |n|
      FactoryHelper::Internet.free_email("#{first_name}#{last_name}#{n}")
    end
  end
end
