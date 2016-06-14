class Api::V1::ItemsController < Api::ApiController
  respond_to :json

  def index
    require "pry"
    binding.pry
    respond_with(@items = Item.all)
  end

  def show
    respond_with(@item = Item.find(params['id']))
  end

  def destroy
  end

  def update
  end
end
