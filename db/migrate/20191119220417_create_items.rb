# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.float :unit_price
      t.references :merchant, foreign_key: true
      t.date :created_at
      t.datetime :updated_at
    end
  end
end
