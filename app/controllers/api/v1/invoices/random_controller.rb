class Api::V1::Invoices::RandomController < ApplicationController

  def show
    render json: InvoiceItem.sample
  end

end
