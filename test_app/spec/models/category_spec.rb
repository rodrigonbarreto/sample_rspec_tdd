require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'valid category' do
    category = create(:category)
    expect(category).to be_valid
  end

  it 'invalid without description' do
    category = build(:category, description: nil)
    category.valid?
    expect(category.errors[:description]).to include("can't be blank")
  end

  it 'using Shoulda Matchers for validate_presence_of :D' do
    should validate_presence_of(:description)
  end
end
