# frozen_string_literal: true

class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :invoices
  has_many :items

  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :invoice_items, through: :items
  has_many :transactions, through: :invoices

  def self.most_revenue(num)
    select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as most_revenue')
      .joins(:invoice_items, :transactions)
      .merge(Transaction.success)
      .group(:id)
      .order('most_revenue desc')
      .limit(num)
  end

  def self.revenue(date)
    joins(:invoice_items, :transactions)
      .merge(Transaction.success)
      .where(date.to_s == 'transactions.created_at')
      .sum('invoice_items.quantity * invoice_items.unit_price')
  end

  def self.favorite_customer(merchant_id)
    select('customers.*, count(transactions) as transaction_count')
      .joins(:customers, :transactions)
      .merge(Transaction.success)
      .where("merchants.id = #{merchant_id}")
      .group('customers.id')
      .order('transaction_count desc')
  end
end
