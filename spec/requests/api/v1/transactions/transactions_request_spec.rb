# frozen_string_literal: true

require 'rails_helper'

describe 'Transactions Requests' do
  it 'sends an index list of all transactions' do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end

  it 'can get one transaction by its id' do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction['id']).to eq(id)
  end
end
