# frozen_string_literal: true

class Api::V1::Transactions::FindController < ApplicationController
  def show
    render json: Transaction.find_by(finder_params)
  end

  def index
    render json: Transaction.where(finder_params)
  end

  private

  def finder_params
    params.permit(:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)
  end
end
