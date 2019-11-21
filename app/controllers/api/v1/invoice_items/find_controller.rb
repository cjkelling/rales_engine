# frozen_string_literal: true

class Api::V1::InvoiceItems::FindController < ApplicationController
  def show
    render json: InvoiceItem.find_by(finder_params)
  end

  def index
    render json: InvoiceItem.where(finder_params)
  end

  private

  def finder_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end
