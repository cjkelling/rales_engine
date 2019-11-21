# frozen_string_literal: true

require 'rails_helper'

describe 'Merchants Requests' do
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

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant['id']).to eq(id)
  end

  it 'can find a single object based on search attributes' do
    merchant = create(:merchant, name: 'merchant')
    merchant2 = create(:merchant, name: 'merchant2')
    merchant3 = create(:merchant, name: 'merchant3')

    get '/api/v1/merchants/find?name=merchant3'

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant['name']).to eq(merchant3.name)
  end
end
