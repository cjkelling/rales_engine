# frozen_string_literal: true

class Api::V1::Items::FindController < ApplicationController
  def show
    render json: Item.find_by(finder_params)
  end

  def index
    render json: Item.where(finder_params)
  end

  private

  def finder_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
