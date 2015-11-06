require 'rails_helper'

RSpec.describe Mastery, type: :model do
  let(:mastery) { FactoryGirl.build :mastery }

  describe 'validations' do
    specify 'it must be associated with a skill' do
      mastery.skill = nil

      expect(mastery).not_to be_valid
    end

    specify 'it must be associated with an expert' do
      mastery.expert = nil

      expect(mastery).not_to be_valid
    end

    specify 'description must be shorter than 250 characters' do
      mastery.description = 'a' * 251

      expect(mastery).not_to be_valid
    end

    specify 'expert cannot add same skill twice' do
      dup_mastery = mastery.dup
      dup_mastery.save!

      expect(mastery).not_to be_valid
      expect(mastery.errors.full_messages).
        to include "Skill has already been added to your profile."
    end
  end
end
