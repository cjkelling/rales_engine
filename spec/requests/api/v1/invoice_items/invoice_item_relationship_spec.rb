# frozen_string_literal: true

require 'rails_helper'

describe 'Invoice_Items Relationship Requests' do
  it 'returns the associated invoice' do
    item = create(:item)
    invoice = create(:invoice)
    invoice_item = InvoiceItem.create!(quantity: 2, unit_price: 3, item_id: item.id, invoice_id: invoice.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.values[0]).to eq(invoice.id)
  end

  it 'returns the associated item' do
    item = create(:item)
    invoice = create(:invoice)
    invoice_item = InvoiceItem.create!(quantity: 2, unit_price: 3, item_id: item.id, invoice_id: invoice.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.values[0]).to eq(item.id)
  end
end
