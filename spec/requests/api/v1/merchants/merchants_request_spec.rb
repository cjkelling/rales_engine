# frozen_string_literal: true

require 'rails_helper'

describe 'Merchants Requests' do
  it 'sends an index list of merchants' do
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
    create_list(:merchant, 3)

    get '/api/v1/merchants/find?id=3'

    expect(response).to be_successful
    expect(merchants.count).to eq(1)
    expect(merchant['id']).to eq(3)
  end
end
