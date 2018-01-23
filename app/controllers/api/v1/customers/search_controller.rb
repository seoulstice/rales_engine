class Api::V1::Customers::SearchController < ApplicationController

  def show
    if params[:id]
      render json: Customer.find(params[:id])
    elsif params[:first_name]
      render json: Customer.find_by(first_name: params[:first_name])
    elsif params[:last_name]
      render json: Customer.find_by(last_name: params[:last_name])
    elsif params[:created_at]
      render json: Customer.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Customer.find_by(updated_at: params[:updated_at])
    end
  end

  def index
    if params[:id]
      render json: Customer.where(id: params[:id])
    elsif params[:first_name]
      render json: Customer.where(first_name: params[:first_name])
    elsif params[:last_name]
      render json: Customer.where(last_name: params[:last_name])
    elsif params[:created_at]
      render json: Customer.where(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Customer.where(updated_at: params[:updated_at])
    end

  end

  private

    def search_params
      params.require(:customer).permit(:id, :name, :created_at, :updated_at)
    end

end
