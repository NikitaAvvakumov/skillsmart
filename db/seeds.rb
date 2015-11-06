if Rails.env == 'development'
  puts 'Seeding the db'

  puts 'Services'
  services = [
    'Automotive',
    'IT',
    'Finances',
    'Home',
    'Fitness',
    'Clothing',
    'Creative',
    'Education'
  ].map { |name| FactoryGirl.create :service, name: name }

  puts 'Skills'
  services.each do |service|
    13.times do |n|
      FactoryGirl.create :skill, name: "#{service.name} skill #{n}", service: service
    end
  end

  puts 'Customers:'
  10.times do |n|
    FactoryGirl.create :customer
    puts n if n > 0 && n % 100 == 0
  end
  Customer.first.update(email: 'customer@example.com')

  puts 'Experts'
  5.times do |n|
    expert = FactoryGirl.create :expert
    service = services.sample
    skills = (1..3).map do
      service.skills.limit(1).offset(rand(service.skills.count)).first
    end
    expert.skills << skills
    puts n if n > 0 && n % 100 == 0
  end
  Expert.first.update(email: 'expert@example.com')
end
