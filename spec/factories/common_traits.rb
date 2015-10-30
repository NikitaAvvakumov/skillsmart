FactoryGirl.define do
  trait :basic_user_info do
    first_name { FactoryHelper::Name.first_name }
    last_name { FactoryHelper::Name.last_name }
    sequence(:email) do |n|
      FactoryHelper::Internet.free_email("#{first_name}#{last_name}#{n}")
    end
    password 'password'
    password_confirmation { password }
  end
end
