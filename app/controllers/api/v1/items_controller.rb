class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render  json: Item.find(params[:id])
  end

  private

    def item_params
      params.require(:item).permit(:id, :name, :created_at, :update_at)
    end

end
