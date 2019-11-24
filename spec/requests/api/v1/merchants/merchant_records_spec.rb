# frozen_string_literal: true

require 'rails_helper'

describe 'Merchant Records Requests' do
  it 'sends an index list of all merchants' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
  end

  it 'can get one merchant by its id' do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant['id']).to eq(id)
  end

  it 'can find a single object based on search attributes' do
    merchant = create(:merchant, name: 'merchant')
    merchant2 = create(:merchant, name: 'merchant2')
    merchant3 = create(:merchant, name: 'merchant3')

    get '/api/v1/merchants/find?name=merchant3'

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant['name']).to eq(merchant3.name)
  end

  it 'can find all matches based on a search attribute' do
    merchant = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant, name: 'merchant3')

    get '/api/v1/merchants/find_all?name=Banana Stand'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(2)
    expect(merchants[0]['name']).to eq(merchant.name)
    expect(merchants[1]['name']).to eq(merchant2.name)
  end

  it 'can return a random resource' do
    merchant = create(:merchant, name: 'merchant')
    merchant2 = create(:merchant, name: 'merchant2')
    merchant3 = create(:merchant, name: 'merchant3')

    get '/api/v1/merchants/random'

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.values[1]).to eq(merchant.name).or eq(merchant2.name).or eq(merchant3.name)
  end
end
