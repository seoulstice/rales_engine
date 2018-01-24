class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController

  def show
    require "pry"; binding.pry
    render json: Customer.customers_with_pending_invoices(params[:id])
  end

end
