require 'rails_helper'

RSpec.describe 'Menu bar', type: :feature do
  before :all do
    @category = Category.first
    @transaction = Entity.first
  end

  before :each do
    visit root_path
    click_button 'LOG IN'
    fill_in 'user_email', with: 'ivan@gmail.com'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
  end

  it 'Log out' do
    click_button(class: 'hamburger-button')
    click_button('Log out')
    expect(current_path).to be == root_path
  end
end
