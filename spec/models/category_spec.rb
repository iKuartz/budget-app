require 'rails_helper'

RSpec.describe Category, type: :model do
  before :all do
    @user = User.first
    @category = Category.first
  end

  it 'Create a valid category' do
    category = Category.new(user: @user, name: 'Food')
    expect(category).to be_valid
  end

  it 'Create an invalid category due to wrong name' do
    category = Category.new(user: @user, name: '')
    expect(category).to be_invalid
    expect(category.errors[:name][0]).to be == "Name can't be blank"
  end
end
