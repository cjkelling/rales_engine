# frozen_string_literal: true

require 'rails_helper'

describe 'Invoice Relationships Requests' do
  it 'returns a collection of associated transactions' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = Invoice.create!(status: 'Shipped', customer_id: customer.id, merchant_id: merchant.id)
    Transaction.create!(credit_card_number: '123412341234', result: 'Success', invoice_id: invoice.id)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.count).to eq(1)
  end

  it 'returns a collection of associated invoice items' do
    customer = create(:customer)
    merchant = create(:merchant)
    item = Item.create!(name: 'Item', description: 'It does something', unit_price: 5, merchant_id: merchant.id)
    invoice = Invoice.create!(status: 'Shipped', customer_id: customer.id, merchant_id: merchant.id)
    InvoiceItem.create!(quantity: 2, unit_price: 3, item_id: item.id, invoice_id: invoice.id)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.count).to eq(1)
  end

  it 'returns a collection of associated items' do
    customer = create(:customer)
    merchant = create(:merchant)
    Item.create!(name: 'Item', description: 'It does something', unit_price: 5, merchant_id: merchant.id)
    Item.create!(name: 'Item', description: 'It does something', unit_price: 5, merchant_id: merchant.id)
    invoice = Invoice.create!(status: 'Shipped', customer_id: customer.id, merchant_id: merchant.id)

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.count).to eq(2)
  end

  it 'returns the associated customer' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = Invoice.create!(status: 'Shipped', customer_id: customer.id, merchant_id: merchant.id)

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.values[0]).to eq(customer.id)
  end

  it 'returns the associated merchant' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = Invoice.create!(status: 'Shipped', customer_id: customer.id, merchant_id: merchant.id)

    get "//api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.values[0]).to eq(merchant.id)
  end
end
