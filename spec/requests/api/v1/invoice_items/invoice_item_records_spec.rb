# frozen_string_literal: true

require 'rails_helper'

describe 'Invoice Item Records Requests' do
  it 'sends an index list of all invoice_items' do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(3)
  end

  it 'can get one invoice_item by its id' do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item['id']).to eq(id)
  end

  it 'can find a single object based on search attributes' do
    invoice_item = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    invoice_item3 = create(:invoice_item, quantity: 2)

    get '/api/v1/invoice_items/find?quantity=2'

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)

    expect(invoice_item['quantity']).to eq(invoice_item3.quantity)
  end

  it 'can find all matches based on a search attribute' do
    invoice_item = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    invoice_item3 = create(:invoice_item, quantity: 2)

    get '/api/v1/invoice_items/find_all?quantity=5'

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(2)
    expect(invoice_items[0]['quantity']).to eq(invoice_item.quantity)
    expect(invoice_items[1]['quantity']).to eq(5)
  end

  it 'can return a random resource' do
    invoice_item = create(:invoice_item, quantity: 1)
    invoice_item2 = create(:invoice_item, quantity: 3)
    invoice_item3 = create(:invoice_item, quantity: 5)

    get '/api/v1/invoice_items/random'

    expect(response).to be_successful

    quantity = JSON.parse(response.body)

    expect(quantity.values[3]).to eq(invoice_item.quantity).or eq(invoice_item2.quantity).or eq(invoice_item3.quantity)
  end
end
