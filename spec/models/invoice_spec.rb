# frozen_string_literal: true

require 'rails_helper'

describe Invoice, type: :model do
  describe 'validations' do
    it { should validate_presence_of :status }
  end
end
