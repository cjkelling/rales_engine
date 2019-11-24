# frozen_string_literal: true

require 'rails_helper'

describe 'Merchants Relationship Requests' do
  it ' returns a collection of items associated with that merchant' do
    merchant = create(:merchant)
    merchant.items.create!(name: 'Banana', description: 'Food', unit_price: 1)
    merchant.items.create!(name: 'Chocolate', description: 'Topping', unit_price: 2)
    merchant.items.create!(name: 'Stick', description: 'Holder', unit_price: 0.50)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  xit 'returns a collection of invoices associated with that merchant from their known orders' do
  end
end
