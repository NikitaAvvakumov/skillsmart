require 'rails_helper'

RSpec.feature 'Expert search', type: :feature do
  background do
    given_skills(skills: %w(Networking Windows Peripherals), service_name: 'IT')
    given_skills(skills: %w(Engine Transmission), service_name: 'Auto')
    given_expert(name: 'IT Guy', skills: %w(Networking))
    given_expert(name: 'Windows Guy', skills: %w(Windows Peripherals))
    given_expert(name: 'Admin Guy', skills: %w(Networking Peripherals))
    given_expert(name: 'Auto Guy', skills: %w(Engine))
  end

  given(:customer) { FactoryGirl.create :customer }

  scenario 'Customer searches for an expert with a single skill' do
    when_customer_searches_for_help_in(service: 'IT',
                                       skills: %w(Networking))

    he_should_see('IT Guy')
    he_should_not_see('Auto Guy')
  end

  scenario 'Customer searches for an expert with multiple skills' do
    when_customer_searches_for_help_in(service: 'IT',
                                       skills: %w(Networking Peripherals))

    he_should_see('Admin Guy')
    he_should_not_see('IT Guy')
    he_should_not_see('Windows Guy')
    he_should_not_see('Auto Guy')
  end

  private

  def given_skills(skills:, service_name:)
    service = FactoryGirl.create :service, name: service_name
    skills.each do |skill_name|
      FactoryGirl.create :skill, name: skill_name, service: service
    end
  end

  def given_expert(name:, skills:)
    first, last = name.split
    expert = FactoryGirl.create :expert, first_name: first, last_name: last
    skills.each do |skill_name|
      expert.skills << Skill.find_by(name: skill_name)
    end
  end

  def when_customer_searches_for_help_in(service:, skills:)
    sign_in_customer(customer)
    visit customer_path(customer)
    click_link 'Find an Expert'
    select service, from: 'In which area do you need assistance?'
    skills.each do |skill_name|
      select skill_name, from: 'What exactly do you need help with?'
    end
    click_button 'Find an expert'
  end

  def he_should_see(text)
    expect(page).to have_text text
  end

  def he_should_not_see(text)
    expect(page).not_to have_text text
  end

  private

  def sign_in_customer(customer)
    visit new_customer_session_path
    fill_in 'Email', with: customer.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
end
