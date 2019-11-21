# frozen_string_literal: true

class Api::V1::Customers::FindController < ApplicationController
  def show
    render json: Customer.find_by(finder_params)
  end

  def index
    render json: Customer.where(finder_params)
  end

  private

  def finder_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
