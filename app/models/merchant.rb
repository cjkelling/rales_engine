# frozen_string_literal: true

class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :invoices
  has_many :items

  has_many :invoice_items, through: :invoices
  has_many :invoice_items, through: :items

  def self.most_revenue(num)
    select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as most_revenue')
      .joins(:invoice_items)
      .group(:id)
      .order('most_revenue desc')
      .limit(num)
  end
end
