class Api::V1::Items::SearchController < ApplicationController

  def show
    render json: InvoiceItem.sample
  end

end
