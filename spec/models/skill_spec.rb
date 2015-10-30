require 'rails_helper'

RSpec.describe Skill, type: :model do
  let(:skill) { FactoryGirl.build_stubbed :skill }

  describe 'validations' do
    it 'validates presense of name' do
      skill.name = nil

      expect(skill).not_to be_valid
    end

    it 'validates uniqueness of name' do
      dup_skill = skill.dup
      dup_skill.save

      expect(skill).not_to be_valid
    end
  end
end
