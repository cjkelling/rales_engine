# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    invoice
    credit_card_number { '123412341234' }
    result { 'Success' }
  end
end
