# frozen_string_literal: true

class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
    create_table :merchants do |t|
      t.string :name
      t.date :created_at
      t.datetime :updated_at
    end
  end
end
