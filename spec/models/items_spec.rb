# frozen_string_literal: true

require 'rails_helper'

describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of :id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :merchant_id }
    it { should validate_presence_of :created_at }
    it { should validate_presence_of :updated_at }
  end
end
