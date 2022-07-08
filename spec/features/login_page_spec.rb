require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before :each do
    visit root_path
    click_button 'LOG IN'
  end

  it 'See username and password inputs, and Log in button' do
    expect(has_field?('user_email') && has_field?('user_password') && has_button?('Log in')).to be true
  end

  it 'Detail error with empty credentials' do
    fill_in 'user_email', with: ''
    fill_in 'user_password', with: ''
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'Detail error with wrong credentials' do
    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'Correct Log in and redirect to HomePage' do
    fill_in 'user_email', with: 'ivan@gmail.com'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
    expect(page).to have_current_path(categories_path)
  end
end
