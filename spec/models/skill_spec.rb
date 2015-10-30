require 'rails_helper'

RSpec.describe Skill, type: :model do
  let(:skill) { FactoryGirl.build_stubbed :skill }

  describe 'validations' do
    specify 'name must be present' do
      skill.name = nil

      expect(skill).not_to be_valid
    end

    describe 'name uniqueness' do
      # must avoid Foreign Key violations when touching the db
      let(:skill) { FactoryGirl.build :skill }

      specify 'enforced for skills belonging to same service' do
        dup_skill = skill.dup
        dup_skill.save!

        expect(skill).not_to be_valid
      end

      specify 'not enforced for skills belonging to different services' do
        dup_skill = skill.dup
        dup_skill.service = FactoryGirl.create :service
        dup_skill.save!

        expect(skill).to be_valid
      end
    end

    specify 'skill must be associated with a service' do
      skill.service = nil

      expect(skill).not_to be_valid
    end
  end
end
