class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController

  def show
    render json: Customer.customers_with_pending_invoices(params[:id])
  end

end
