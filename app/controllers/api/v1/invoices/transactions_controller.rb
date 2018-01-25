class Api::V1::Invoices::TransactionsController < ApplicationController

  def show
    render json: Invoice.find(params[:id]).transactions
  end

end
