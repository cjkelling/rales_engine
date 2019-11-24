# frozen_string_literal: true

require 'rails_helper'

describe 'Items Relationship Requests' do
  it 'returns a collection of associated invoice items' do
    item = create(:item)
    invoice = create(:invoice)
    InvoiceItem.create!(quantity: 2, unit_price: 3, item_id: item.id, invoice_id: invoice.id)
    InvoiceItem.create!(quantity: 3, unit_price: 4, item_id: item.id, invoice_id: invoice.id)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.count).to eq(2)
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
