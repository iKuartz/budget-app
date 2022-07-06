require 'rails_helper'

RSpec.describe 'Transactions pages', type: :feature do
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
    click_on('Streaming', match: :first)
  end

  it 'Expect section Title' do
    expect(page).to have_content('Transactions')
  end

  it 'Navigate to add transaction page' do
    click_link('Add Transaction')
    expect(current_path).to be == new_entity_path
  end

  it 'Add a new Transaction' do
    click_link('Add Transaction')
    fill_in 'entity_name', with: 'Amazon Prime'
    fill_in 'entity_amount', with: '2'
    click_button('Create')
    expect(Entity.last.name).to be == 'Amazon Prime'
  end

  it 'Navigate to transactions\'s detail page' do
    click_link(@transaction.name, match: :first)
    expect(page).to have_content('Details')
  end
end
