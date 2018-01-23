class Api::V1::Items::SearchController < ApplicationController

  def index
    if params[:id]
      Item.find(params[:id])
    elsif params[:name]
      Item.where(name: params[:name])
    elsif params[:created_at]
      Item.where(created_at: params[:created_at])
    elsif params[:update_at]
      Item.where(updated_at: params[:updated_at])
    end
  end

  def show
    if params[:id]
      Item.find(params[:id])
    elsif params[:name]
      Item.find_by(name: params[:name])
    elsif params[:created_at]
      Item.find_by(created_at: params[:created_at])
    elsif params[:update_at]
      Item.find_by(updated_at: params[:updated_at])
    end
  end

end
