FactoryGirl.define do
  factory :mastery do
    description { FactoryHelper::Lorem.sentence(5) }
    skill
    expert
  end

end
