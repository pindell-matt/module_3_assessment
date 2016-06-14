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
    data = item_params
    item = Item.create(
      name:        data["name"],
      description: data["description"],
      image_url:   data["image_url"]
    )
    respond_with item
  end

  private
    def item_params
      params.require("parameters").permit("name", "description", "image_url")
    end
end
