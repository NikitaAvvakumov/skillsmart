module CustomersHelper
  def full_name_for(customer)
    "#{customer.first_name} #{customer.last_name}"
  end
end
