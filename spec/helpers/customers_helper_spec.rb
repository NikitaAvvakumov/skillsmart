require 'rails_helper'

RSpec.describe CustomersHelper, type: :helper do
  describe '#full_name_for' do
    it 'combines first_name and last_name' do
      customer = OpenStruct.new(first_name: 'John', last_name: 'Smith')

      expect(helper.full_name_for(customer)).to eq 'John Smith'
    end
  end
end
