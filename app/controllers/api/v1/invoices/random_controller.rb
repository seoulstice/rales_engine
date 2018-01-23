class Api::V1::Invoices::SearchController < ApplicationController

  def show
    render json: InvoiceItem.sample
  end

end
