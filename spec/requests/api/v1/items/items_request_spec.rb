# frozen_string_literal: true

require 'rails_helper'

describe 'Items Requests' do
  it 'sends an index list of all items' do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  it 'can get one item by its id' do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item['id']).to eq(id)
  end

  it 'can find a single object based on search attributes' do
    item = create(:item, name: 'item')
    item2 = create(:item, name: 'item2')
    item3 = create(:item, name: 'item3')

    get '/api/v1/items/find?name=item2'

    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item['name']).to eq(item2.name)
  end

  it 'can find all matches based on a search attribute' do
    item = create(:item)
    item2 = create(:item)
    item3 = create(:item, name: 'item3')

    get '/api/v1/items/find_all?name=Banana'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(2)
    expect(items[0]['name']).to eq(item.name)
    expect(items[1]['name']).to eq('Banana')
  end
end
