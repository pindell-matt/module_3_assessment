class Api::V1::ItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params['id'])
  end

  def destroy
    item = Item.find(params['id'])
    respond_with item.destroy
  end

  def create
    require "pry"
    binding.pry
  end
end
