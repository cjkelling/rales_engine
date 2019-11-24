# frozen_string_literal: true

class Api::V1::Items::MerchantController < ApplicationController
  def index
    render json: Item.find(params[:id]).merchant
  end
end
