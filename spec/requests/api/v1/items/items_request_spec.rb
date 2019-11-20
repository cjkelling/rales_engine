# frozen_string_literal: true

require 'rails_helper'

describe 'Items Requests' do
  it 'sends an index list of all items' do
    banana_stand = Merchant.create!(name: 'Banana Stand')
    banana_stand.items.create!(name: 'Banana', description: 'Food', unit_price: 2)
    banana_stand.items.create!(name: 'Banana2', description: 'Food2', unit_price: 3)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(2)
  end

  it 'can get one item by its id' do
    banana_stand = Merchant.create!(name: 'Banana Stand')
    id = banana_stand.items.create!(name: 'Banana', description: 'Food', unit_price: 2).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item['id']).to eq(id)
  end
end
