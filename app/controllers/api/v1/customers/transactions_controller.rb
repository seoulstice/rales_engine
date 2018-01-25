class Api::V1::Customers::TransactionsController < ApplicationController

  def show
    render json: Customer.find(params[:id]).transactions
  end

end
