# frozen_string_literal: true

require 'rails_helper'

describe 'Customer Relationships Requests' do
  it 'returns a collection of associated invoices' do
    customer = create(:customer)
    merchant = create(:merchant)
    Invoice.create!(status: 'Shipped', customer_id: customer.id, merchant_id: merchant.id)
    Invoice.create!(status: 'Shipped', customer_id: customer.id, merchant_id: merchant.id)
    Invoice.create!(status: 'Shipped', customer_id: customer.id, merchant_id: merchant.id)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.count).to eq(3)
  end

  it 'returns a collection of associated transactions' do
  end
end
