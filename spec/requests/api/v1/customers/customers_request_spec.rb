# frozen_string_literal: true

require 'rails_helper'

describe 'Customers Requests' do
  it 'sends an index list of all customers' do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_successful

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(3)
  end

  it 'can get one customer by its id' do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer['id']).to eq(id)
  end
end
