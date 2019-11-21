# frozen_string_literal: true

class Api::V1::Transactions::RandomController < ApplicationController
  def show
    render json: Transaction.order('random()').first
  end
end
