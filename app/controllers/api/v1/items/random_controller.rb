class Api::V1::Items::RandomController < ApplicationController

  def show
    render json: InvoiceItem.sample
  end

end
