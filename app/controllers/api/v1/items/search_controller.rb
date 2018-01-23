class Api::V1::Items::SearchController < ApplicationController

  def index
    if params[:id]
      render json: Item.find(params[:id]), status: 200
    elsif params[:name]
      render json: Item.where(name: params[:name]), status: 200
    elsif params[:created_at]
      render json: Item.where(created_at: params[:created_at]), status: 200
    elsif params[:update_at]
      render json: Item.where(updated_at: params[:updated_at]), status: 200
    end
  end

  def show
    if params[:id]
      render json: Item.find(params[:id]), status: 200
    elsif params[:name]
      render json: Item.find_by(name: params[:name]), status: 200
    elsif params[:created_at]
      render json: Item.find_by(created_at: params[:created_at]), status: 200
    elsif params[:update_at]
      render json: Item.find_by(updated_at: params[:updated_at]), status: 200
    end
  end

  private

    def item_params
      params.require(:item).permit(:id, :name, :created_at, :update_at)
    end

end
