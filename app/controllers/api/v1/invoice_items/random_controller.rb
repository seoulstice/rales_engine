class Api::V1::InvoiceItems::SearchController < ApplicationController

  def show
    render json: InvoiceItem.sample
  end

end
