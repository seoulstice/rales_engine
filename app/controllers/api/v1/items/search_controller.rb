class Api::V1::Items::SearchController < ApplicationController

  def index
    if params[:id]
      render json: Item.find(params[:id])
    elsif params[:name]
      render json: Item.where(name: params[:name])
    elsif params[:description]
      render json: Item.where(description: params[:description])
    elsif params[:unit_price]
      render json: Item.where(unit_price: params[:unit_price])
    elsif params[:merchant_id]
      render json: Item.where(merchant_id: params[:merchant_id])
    elsif params[:created_at]
      render json: Item.where(created_at: params[:created_at].to_datetime)
    elsif params[:update_at]
      render json: Item.where(updated_at: params[:updated_at].to_datetime)
    end
  end

  def show
    if params[:id]
      render json: Item.find(params[:id])
    elsif params[:name]
      render json: Item.find_by(name: params[:name])
    elsif params[:description]
      render json: Item.find_by(description: params[:description])
    elsif params[:unit_price]
      render json: Item.find_by(unit_price: params[:unit_price])
    elsif params[:merchant_id]
      render json: Item.find_by(merchant_id: params[:merchant_id])
    elsif params[:created_at]
      render json: Item.find_by(created_at: params[:created_at].to_datetime)
    elsif params[:update_at]
      render json: Item.find_by(updated_at: params[:updated_at].to_datetime)
    end
  end

  private

    def item_params
      params.require(:item).permit(:id, :name, :description, :merchant_id, :unit_price, :created_at, :update_at)
    end

end
