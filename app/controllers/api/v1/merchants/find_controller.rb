# frozen_string_literal: true

class Api::V1::Merchants::FindController < ApplicationController
  def show
    render json: Merchant.find_by(finder_params)
  end

  def index
    render json: Merchant.where(finder_params)
  end

  private

  def finder_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
