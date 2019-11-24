# frozen_string_literal: true

require 'rails_helper'

describe 'Transactions Relationship Requests' do
  it 'returns the associated invoice' do
    invoice = create(:invoice)
    transaction = Transaction.create!(credit_card_number: '123412341234', result: 'Success', invoice_id: invoice.id)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.values[0]).to eq(invoice.id)
  end
end
