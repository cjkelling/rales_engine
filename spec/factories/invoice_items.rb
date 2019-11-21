# frozen_string_literal: true

FactoryBot.define do
  factory :invoice_item do
    invoice
    item
    quantity { 5 }
    unit_price { 2.50 }
  end
end
