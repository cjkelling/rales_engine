# frozen_string_literal: true

class Api::V1::Merchants::RandomController < ApplicationController
  def show
    render json: Merchant.order('random()').first
  end
end
