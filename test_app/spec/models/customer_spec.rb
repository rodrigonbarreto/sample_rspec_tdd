require 'rails_helper'

RSpec.describe Customer, type: :model do
  #you can use too fixtures :all
  it '#full_name - overrite Atributo' do
    cust = create(:customer)
    expect(cust.full_name).to start_with("Sr.")
  end
  it '#full_name witsh alias :user' do
    customer = create(:user)
    expect(customer.full_name).to start_with("Sr. ")
  end
    
  it '#full_name - overwrite Atribut' do
    customer = create(:customer, name: "Jackson Pires" )
    expect(customer.full_name).to eq("Sr. Jackson Pires")
  end

  it 'customer vip' do
    customer = create(:vip)
    expect(customer.vip).to eq(true)
  end

  it 'customer not vip' do
    customer = create(:default)
    expect(customer.vip).to eq(false)
  end

  it '#creat and all.size' do 
   expect{ create(:customer) }.to change{Customer.all.size}.by(1) 
  end
end
