require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "works! (now write some real specs)" do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it 'index - json 200 ok' do
      get "/customers.json"
      expect(response).to have_http_status(200)
      expect(response.body).to  include_json([id: 1, name: (be_kind_of String), email: (be_kind_of String)])
    end

    it 'show - json 200 ok' do
      get "/customers/1.json"
      expect(response).to have_http_status(200)
      expect(response.body).to  include_json(id: 1, name: (be_kind_of String), email: (be_kind_of String))
    end

    it 'create a customer' do
      # do login
      member = create(:member)
      login_as(member, scope: :member)
      # set header
      headers = {"ACCEPT" => "application/json"}

      customers_params = attributes_for(:customer)
      post "/customers", params: {customer: customers_params}, headers: headers

      expect(response.body).to include_json(
         id: /\d/,
         name: customers_params[:name],
         email: customers_params.fetch(:email)
       )
    end

    it 'updte a customer' do
      # do login
      member = create(:member)
      login_as(member, scope: :member)
      # set header
      headers = {"ACCEPT" => "application/json"}

      customers = Customer.first
      customers.name += "- Atualizado"
      patch "/customers/#{customers.id}", params: {customer: customers.attributes}, headers: headers
      expect(response.body).to include_json(
         id: /\d/,
         name: customers.name,
         email: customers.email
       )
    end

    it 'Delete a customer' do
      # do login
      member = create(:member)
      login_as(member, scope: :member)
      # set header
      headers = {"ACCEPT" => "application/json"}
      customers = Customer.first

      #delete "/customers/#{customers.id}", headers: headers
      expect{ delete "/customers/#{customers.id}", headers: headers }.to change(Customer, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end
end
