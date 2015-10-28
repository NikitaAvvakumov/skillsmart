require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    context 'when customer is persisted' do
      let(:customer) { FactoryGirl.build_stubbed :customer }

      it 'requires first_name' do
        customer.first_name = nil

        expect(customer).not_to be_valid
      end

      it 'requires last_name' do
        customer.last_name = nil

        expect(customer).not_to be_valid
      end
    end

    context 'when customer is not persisted' do
      let(:customer) { FactoryGirl.build :customer }

      it 'does not require first_name' do
        customer.first_name = nil

        expect(customer).to be_valid
      end

      it 'does not require last_name' do
        customer.last_name = nil

        expect(customer).to be_valid
      end
    end

    describe 'email validation' do
      let(:customer) { FactoryGirl.build_stubbed :customer }

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
