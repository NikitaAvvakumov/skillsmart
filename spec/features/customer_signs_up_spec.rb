require 'rails_helper'

RSpec.feature 'Customer authentication', type: :feature do
  scenario 'Customer signs up' do
    visit root_url
    click_link 'Customer sign up'
    fill_in 'Email', with: 'customer@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_text 'Edit your name'
  end
end
