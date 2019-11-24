# frozen_string_literal: true

class Invoice < ApplicationRecord
  validates_presence_of :status

  belongs_to :customer
  belongs_to :merchant

  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :items, through: :merchant
  has_many :transactions
end
