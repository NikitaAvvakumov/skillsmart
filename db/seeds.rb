if Rails.env == 'development'
  puts 'Seeding the db'

  puts 'Customers:'
  1000.times do |n|
    FactoryGirl.create :customer
    puts n if n > 0 && n % 100 == 0
  end
end
