require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with description, price, and category' do
    product = create(:product)
    expect(product).to be_valid
  end

  it 'Product is invalid without description' do
    product = build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to include("can't be blank")
  end

  it 'Product is invalid without category' do
    product = build(:product, category:nil)
    product.valid?
    expect(product.errors[:category]).to include("can't be blank")
  end
  it 'Product is invalid without Price' do
    product = build(:product, price:nil)
    product.valid?
    expect(product.errors[:price]).to include("can't be blank")
  end

  it 'show full description' do
    product = build(:product)
    expect(product.full_description).to eq("#{product.description} - #{product.price}")
  end

  context 'Validations' do
    it 'using Shoulda Matchers for validate_presence_of :D' do
      should validate_presence_of(:description)
      should validate_presence_of(:price)
      should validate_presence_of(:category)
      # we can use too is_expected.to to be more verbose. ex: under
      is_expected.to validate_presence_of(:description)
    end

  end

  context 'Associations' do
    it 'using Shoulda Matchers for validate_presence_of :D' do
      should belong_to(:category)
      # we can use too is_expected.to to be more verbose. ex: under
      is_expected.to belong_to(:category)
    end
  end
end
