# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    merchant
    name { 'Banana' }
    description { 'Food' }
    unit_price { 2 }
  end
end
