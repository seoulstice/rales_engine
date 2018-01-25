class Api::V1::Customers::InvoicesController < ApplicationController

  def show
    render json: Customer.find(params[:id]).invoices
  end

end
