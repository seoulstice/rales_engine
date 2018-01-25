class Api::V1::Invoices::CustomerController < ApplicationController

  def show
    render json: Invoice.find(params[:id]).customer
  end

end
