# frozen_string_literal: true

class Api::V1::Invoices::FindController < ApplicationController
  def show
    render json: Invoice.find_by(finder_params)
  end

  def index
    render json: Invoice.where(finder_params)
  end

  private

  def finder_params
    params.permit(:id, :status, :customer_id, :merchant_id, :created_at, :updated_at)
  end
end
