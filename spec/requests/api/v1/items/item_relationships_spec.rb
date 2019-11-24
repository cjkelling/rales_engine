# frozen_string_literal: true

require 'rails_helper'

describe 'Items Relationship Requests' do
  it 'returns a collection of associated invoice items' do
    merchant = create(:merchant)
    merchant.items.create!(name: 'Banana', description: 'Food', unit_price: 1)
    merchant.items.create!(name: 'Chocolate', description: 'Topping', unit_price: 2)
    merchant.items.create!(name: 'Stick', description: 'Holder', unit_price: 0.50)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  it 'returns the associated merchant' do
    merchant = create(:merchant)
    item = Item.create!(name: 'Item', description: 'It does something', unit_price: 5, merchant_id: merchant.id)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.values[0]).to eq(merchant.id)
  end
end
