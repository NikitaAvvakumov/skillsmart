require 'rails_helper'

RSpec.feature 'Expert profile management', type: :feature do
  given(:expert) { FactoryGirl.create :expert }

  background do
    service = FactoryGirl.create :service, name: 'IT'
    FactoryGirl.create :skill, name: 'networking', service: service
    sign_in_expert(expert)
  end

  scenario 'Expert add skills' do
    visit expert_path(expert)
    click_link 'Add a skill'
    select 'IT', from: 'In which service area is your skill?'
    select 'networking', from: 'Please select your skill'
    fill_in 'Please briefly describe your proficiency in the chosen skill (250 characters max)', with: 'I have a router'
    click_button 'Add skill'

    expect(page).to have_text('Skill added')
    expect(page).to have_text('I have a router')
  end

  private

  def sign_in_expert(expert)
    visit new_expert_session_path
    fill_in 'Email', with: expert.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
end
