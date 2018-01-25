class Api::V1::InvoiceItems::SearchController < ApplicationController

  def index
    render json: InvoiceItem.where(invoice_item_params)
  end

  def show
    render json: InvoiceItem.where(invoice_item_params).order(:id).limit(1).first
  end

  private

    def invoice_item_params
      params[:unit_price] = (params[:unit_price].to_f*100).round(0) if params[:unit_price]
      params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
    end

end
