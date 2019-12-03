# frozen_string_literal: true

class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    render json: Merchant.revenue(revenue_params[:date])
  end

  private

  def revenue_params
    params.permit(:date)
  end
end
