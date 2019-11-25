# frozen_string_literal: true

require 'rails_helper'

describe 'Merchant Business Intelligence Requests' do
  it 'returns the top x merchants ranked by total revenue' do
    merchant = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)

    item = Item.create!(name: 'Item', description: 'It does something', unit_price: 5, merchant_id: merchant.id)
    item2 = Item.create!(name: 'Item', description: 'It does something', unit_price: 5, merchant_id: merchant2.id)
    item3 = Item.create!(name: 'Item', description: 'It does something', unit_price: 5, merchant_id: merchant3.id)

    customer = create(:customer)

    invoice = Invoice.create!(status: 'Shipped', customer_id: customer.id, merchant_id: merchant.id)
    invoice2 = Invoice.create!(status: 'Shipped', customer_id: customer.id, merchant_id: merchant2.id)
    invoice3 = Invoice.create!(status: 'Shipped', customer_id: customer.id, merchant_id: merchant3.id)

    invoice_item = InvoiceItem.create!(quantity: 20, unit_price: 10, item_id: item.id, invoice_id: invoice.id)
    invoice_item2 = InvoiceItem.create!(quantity: 2, unit_price: 3, item_id: item2.id, invoice_id: invoice2.id)
    invoice_item3 = InvoiceItem.create!(quantity: 12, unit_price: 13, item_id: item3.id, invoice_id: invoice3.id)

    get '/api/v1/merchants/most_revenue?quantity=2'

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.count).to eq(2)
    expect(result[0].values[0]).to eq(merchant.id)
    expect(result[1].values[0]).to eq(merchant3.id)
  end

  xit 'returns the total revenue for date x across all merchants' do
  end

  xit 'returns the customer who has conducted the most total number of successful transactions' do
  end

  ### Boss Mode ###
  # it 'returns a collection of customers which have pending (unpaid) invoices.' do
  #
  # end
end
