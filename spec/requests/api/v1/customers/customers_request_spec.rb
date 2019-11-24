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

  it 'can find a single object based on search attributes' do
    customer = create(:customer)
    customer2 = create(:customer)
    customer3 = create(:customer, last_name: 'Smith')

    get '/api/v1/customers/find?last_name=Smith'

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer['last_name']).to eq(customer3.last_name)
  end

  it 'can find all matches based on a search attribute' do
    customer = create(:customer)
    customer2 = create(:customer)
    customer3 = create(:customer, last_name: 'Smith')

    get '/api/v1/customers/find_all?last_name=Doe'

    expect(response).to be_successful

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(2)
    expect(customers[0]['last_name']).to eq(customer.last_name)
    expect(customers[1]['last_name']).to eq('Doe')
  end

  it 'can return a random resource' do
    customer = create(:customer, first_name: 'Greg')
    customer2 = create(:customer, first_name: 'Michael')
    customer3 = create(:customer, first_name: 'John')

    get '/api/v1/customers/random'

    expect(response).to be_successful

    first_name = JSON.parse(response.body)

    expect(first_name.values[1]).to eq(customer.first_name).or eq(customer2.first_name).or eq(customer3.first_name)
  end
end
