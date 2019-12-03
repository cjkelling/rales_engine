# frozen_string_literal: true

class Transaction < ApplicationRecord
  validates_presence_of :credit_card_number,
                        :result

  belongs_to :invoice

  scope :success, -> { where(result: 'success') }
  scope :failed, -> { where(result: 'failed') }
end
