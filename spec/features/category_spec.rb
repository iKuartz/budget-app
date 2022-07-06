require 'rails_helper'

RSpec.describe 'Category pages', type: :feature do
  before :all do
    @category = Category.first
  end
  before :each do
    visit root_path
    click_button 'LOG IN'
    fill_in 'user_email', with: 'ivan@gmail.com'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
  end

  it 'Expect section Title' do
    expect(page).to have_content('Categories')
  end

  it 'Expect to have category Streaming' do
    expect(page).to have_content('Streaming')
  end

  it 'Navigate to categorie\'s transaction page' do
    click_on('Streaming', match: :first)
    expect(current_path).to be == entities_path
    expect(page).to have_content('Transactions')
  end

  it 'Navigate to add category page' do
    click_button('Add Category')
    expect(current_path).to be == new_category_path
  end

  it 'Add a new Category' do
    click_button('Add Category')
    fill_in 'category_name', with: 'Food'
    click_button('Create')
    expect(Category.last.name).to be == 'Food'
  end
end
