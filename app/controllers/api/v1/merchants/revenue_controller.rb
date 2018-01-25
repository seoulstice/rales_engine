class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: Merchant.all_revenue_by_date(params[:date])
  end

  def show
    if params[:date]
      render json: Merchant.revenue_on_date(params[:id], params[:date]), serializer: RevenueSerializer
    else
      render json: Merchant.revenue(params[:id]), serializer: RevenueSerializer
    end
  end

  private

  def revenue_params
    # if params[:date]
    #   params[:date]
    # end
    params.permit(:id, :date)
  end

  def revenue_params
    params.permit(:id, :date)
  end

end
