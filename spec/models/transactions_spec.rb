# frozen_string_literal: true

require 'rails_helper'

describe Transaction, type: :model do
  describe 'validations' do
    it { should validate_presence_of :id }
    it { should validate_presence_of :invoice_id }
    it { should validate_presence_of :credit_card_number }
    it { should validate_presence_of :credit_card_expiration_date }
    it { should validate_presence_of :result }
    it { should validate_presence_of :created_at }
    it { should validate_presence_of :updated_at }
  end
end