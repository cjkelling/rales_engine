# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { 'Banana' }
    description { 'Stand' }
    unit_price { 200 }
  end
end
