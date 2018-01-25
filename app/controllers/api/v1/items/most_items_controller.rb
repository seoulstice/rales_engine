class Api::V1::Items::MostItemsController < ApplicationController

  def index
    render json: Item.most_items(query_params[:quantity])
  end

  private

    def query_params
      params.permit(:quantity)
    end
    
end
