class Api::V1::Transactions::InvoicesController < ApplicationController

  def show
    render json: Transaction.find(params[:id]).invoice
  end

end
