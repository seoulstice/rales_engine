class Api::V1::Merchants::SearchController < ApplicationController

  def show
    if params[:id]
      render json: Merchant.find(id: params[:id])
    elsif params[:name]
      render json: Merchant.find_by(name: params[:name])
    elsif params[:created_at]
      render json: Merchant.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Merchant.find_by(updated_at: params[:updated_at])
    end
  end

  def index
    if params[:id]
      render json: Merchant.find(id: params[:id])
    elsif params[:name]
      render json: Merchant.where(name: params[:name])
    elsif params[:created_at]
      render json: Merchant.where(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Merchant.where(updated_at: params[:updated_at])
    end

  end

  private

    def search_params
      params.require(:merchant).permit(:id, :name, :created_at, :updated_at)
    end

end
