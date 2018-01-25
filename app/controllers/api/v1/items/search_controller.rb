class Api::V1::Items::SearchController < ApplicationController

  def index
    render json: Item.where(item_params)
  end

  def show
    render json: Item.where(item_params).order(:id).limit(1).first
  end

  private

    def item_params
      params[:unit_price] = (params[:unit_price].to_f*100).round(0) if params[:unit_price]
      params.permit(:id, :name, :description, :merchant_id, :unit_price, :created_at, :updated_at)
    end

end
