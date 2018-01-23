class Api::V1::Items::SearchController < ApplicationController

  def show
    if params[:id]
    elsif params[:name]
      Item.find_by(name: params[:name])
    elsif params[:created_at]
    elsif params[:update_at]
    end
  end

end
