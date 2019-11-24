# frozen_string_literal: true

require 'rails_helper'

describe 'Invoice Records Requests' do
  it 'sends an index list of all invoices' do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(3)
  end

  it 'can get one invoice by its id' do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice['id']).to eq(id)
  end

  it 'can find a single object based on search attributes' do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    invoice3 = create(:invoice, status: 'not shipped')

    get '/api/v1/invoices/find?status=not shipped'

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice['status']).to eq(invoice3.status)
  end

  it 'can find all matches based on a search attribute' do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    invoice3 = create(:invoice, status: 'not shipped')

    get '/api/v1/invoices/find_all?status=Shipped'

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(2)
    expect(invoices[0]['status']).to eq(invoice.status)
    expect(invoices[1]['status']).to eq('Shipped')
  end

  it 'can return a random resource' do
    invoice = create(:invoice, status: 'Shipped')
    invoice2 = create(:invoice, status: 'Not Shipped')
    invoice3 = create(:invoice, status: 'Shipped')

    get '/api/v1/invoices/random'

    expect(response).to be_successful

    status = JSON.parse(response.body)

    expect(status.values[3]).to eq(invoice.status).or eq(invoice2.status).or eq(invoice3.status)
  end
end
