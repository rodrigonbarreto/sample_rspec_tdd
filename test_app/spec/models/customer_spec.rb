require 'rails_helper'

RSpec.describe Customer, type: :model do
  #you can use too fixtures :all
  it '#full_name - overrite Atributo' do
    cust = create(:customer)
    expect(cust.full_name).to eq("Sr. Rodrigo Barreto")
  end
end
