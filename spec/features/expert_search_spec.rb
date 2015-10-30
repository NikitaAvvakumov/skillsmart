require 'rails_helper'

RSpec.feature 'Expert search', type: :feature do
  scenario 'Customer searches for an expert with a single skill' do
    given_an_expert_exists(name: 'IT Guy',
                           skills_array: %w(networking peripherals),
                           service: 'IT')
    given_an_expert_exists(name: 'Auto Guy',
                           skills_array: %w(transmission engine),
                           service: 'Automotive')

    when_customer_searches_for_help_in(service: 'IT',
                                       skills_array: %w(networking))

    he_should_see('IT Guy')
    he_should_not_see('Auto Guy')
  end

  private

  def given_an_expert_exists(name:, skills_array:, service:)
    FactoryGirl.create :service, name: service
    skills = skills_array.map do |skill_name|
      FactoryGirl.create :skill, name: skill_name, service: service
    end
    FactoryGirl.create :expert, skills: skills
  end

  def when_customer_searches_for_help_in(service:, skills_array:)

  end

  def he_should_see(text)

  end

  def he_should_not_see(text)

  end
end
