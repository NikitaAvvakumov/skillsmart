require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    let(:customer) { FactoryGirl.build_stubbed :customer }

    it 'requires first_name' do
      customer.first_name = nil

      expect(customer).not_to be_valid
    end

    it 'requires last_name' do
      customer.last_name = nil

      expect(customer).not_to be_valid
    end

    describe 'email validation' do
      it 'is required' do
        customer.email = nil

        expect(customer).not_to be_valid
      end

      it 'must be unique' do
        dup_customer = customer.dup
        dup_customer.save

        expect(customer).not_to be_valid
      end
    end
  end
end
