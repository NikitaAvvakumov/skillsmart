require 'rails_helper'

RSpec.describe Service, type: :model do
  let(:service) { FactoryGirl.build_stubbed :service }

  describe 'validations' do
    it 'validates presense of name' do
      service.name = nil

      expect(service).not_to be_valid
    end

    it 'validates uniqueness of name' do
      dup_service = service.dup
      dup_service.save

      expect(service).not_to be_valid
    end
  end
end
