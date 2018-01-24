class Api::V1::Merchants::MostRevenueController < ApplicationController

  def show
    render json: Merchant.most_revenue(revenue_params[:quantity])
  end

  private
  
    def revenue_params
      params.permit(:quantity)
    end

end
