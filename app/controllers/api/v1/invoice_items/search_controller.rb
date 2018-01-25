class Api::V1::InvoiceItems::SearchController < ApplicationController

  def index
    render json: InvoiceItem.where(invoice_item_params).order(:id)
  end

  def show
    render json: InvoiceItem.find_by(invoice_item_params).order(:id).limit(1).first
  end

  private

    def invoice_item_params
      params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :update_at)
    end

end
