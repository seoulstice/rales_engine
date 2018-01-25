class Api::V1::Merchants::MostItemsController < ApplicationController

  def show
    render json: Merchant.most_items(item_params[:quantity])
  end

  private

    def item_params
      params.permit(:quantity)
    end

end
