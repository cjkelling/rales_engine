# frozen_string_literal: true

require 'rails_helper'

describe InvoiceItem, type: :model do
  describe 'validations' do
    it { should validate_presence_of :id }
    it { should validate_presence_of :item_id }
    it { should validate_presence_of :invoice_id }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :created_at }
    it { should validate_presence_of :updated_at }
  end
end