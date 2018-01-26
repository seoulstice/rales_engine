class Api::V1::InvoiceItems::InvoiceController < ApplicationController

  def show
    render json: InvoiceItem.find(params[:id]).invoice
  end
end
