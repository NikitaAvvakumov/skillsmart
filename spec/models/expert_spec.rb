require 'rails_helper'
require 'models/shared_examples_for_users'

RSpec.describe Expert, type: :model do
  it_behaves_like 'any user'

  describe '.search_by_skills' do
    let(:networking) { FactoryGirl.create :skill }
    let(:peripherals) { FactoryGirl.create :skill }
    let(:engine) { FactoryGirl.create :skill }
    let(:transmission) { FactoryGirl.create :skill }
    let(:john) { FactoryGirl.create :expert, first_name: 'John' }
    let(:jack) { FactoryGirl.create :expert, first_name: 'Jack' }

    before(:each) do
      john.skills << networking << peripherals
      jack.skills << networking << transmission
    end

    it 'finds experts by single skill' do
      expect(Expert.search_by_skills([transmission.id]).to_a).
        to match_array [jack]
      expect(Expert.search_by_skills([networking.id]).to_a).
        to match_array [john, jack]
    end

    it 'finds experts by multiple skills' do
      expect(Expert.search_by_skills([networking.id, peripherals.id]).to_a).
        to match_array [john]
    end

    it 'returns empty query when no expert has requisite skills' do
      expect(Expert.search_by_skills(engine.id)).not_to exist
      expect(Expert.search_by_skills([peripherals.id, transmission.id])).not_to exist
    end
  end
end
