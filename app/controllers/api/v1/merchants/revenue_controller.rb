class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    render json: Merchant.revenue(params[:id])
  end

end
