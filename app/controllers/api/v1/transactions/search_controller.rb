class Api::V1::Transactions::SearchController < ApplicationController

  def show
    if params[:id]
      render json: Transaction.find(params[:id])
    elsif params[:name]
      render json: Transaction.find_by(name: params[:name])
    elsif params[:created_at]
      render json: Transaction.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Transaction.find_by(updated_at: params[:updated_at])
    end
  end

  def index
    if params[:id]
      render json: Transaction.where(id: params[:id])
    elsif params[:name]
      render json: Transaction.where(name: params[:name])
    elsif params[:created_at]
      render json: Transaction.where(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Transaction.where(updated_at: params[:updated_at])
    end

  end

  private

    def search_params
      params.require(:transaction).permit(:id, :name, :created_at, :updated_at)
    end

end
