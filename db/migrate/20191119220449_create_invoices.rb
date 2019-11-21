# frozen_string_literal: true

class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :customer, foreign_key: true
      t.references :merchant, foreign_key: true
      t.string :status
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
