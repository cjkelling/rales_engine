# frozen_string_literal: true

require 'rails_helper'

describe 'Transaction Records Requests' do
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

  it 'can find a single object based on search attributes' do
    transaction = create(:transaction)
    transaction2 = create(:transaction)
    transaction3 = create(:transaction, result: 'not successful')

    get '/api/v1/transactions/find?result=not successful'

    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction['result']).to eq(transaction3.result)
  end

  it 'can find all matches based on a search attribute' do
    transaction = create(:transaction)
    transaction2 = create(:transaction)
    transaction3 = create(:transaction, result: 'not successful')

    get '/api/v1/transactions/find_all?result=Success'

    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(2)
    expect(transactions[0]['result']).to eq(transaction.result)
    expect(transactions[1]['result']).to eq('Success')
  end

  it 'can return a random resource' do
    transaction = create(:transaction, result: 'Success')
    transaction2 = create(:transaction, result: 'Not Successful')
    transaction3 = create(:transaction, result: 'Success')

    get '/api/v1/transactions/random'

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.values[4]).to eq(transaction.result).or eq(transaction2.result).or eq(transaction3.result)
  end
end
