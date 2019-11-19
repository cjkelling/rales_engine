# frozen_string_literal: true

class Merchant < ApplicationRecord
  validates_presence_of :id,
                        :invoice_id,
                        :credit_card_number,
                        :credit_card_expiration_date,
                        :result,
                        :created_at,
                        :updated_at
end
