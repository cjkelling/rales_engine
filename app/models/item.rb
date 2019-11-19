# frozen_string_literal: true

class Item < ApplicationRecord
  validates_presence_of :id,
                        :name,
                        :description,
                        :unit_price,
                        :merchant_id,
                        :created_at,
                        :updated_at
end
