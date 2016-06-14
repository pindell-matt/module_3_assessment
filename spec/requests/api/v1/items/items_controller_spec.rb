require 'rails_helper'

RSpec.describe "Api::V1::ItemsController Endpoint", type: :request do

  before(:each) do
    @item = Item.create(
      name:        "Jazz",
      description: "Moar Jazz",
      image_url:   "rick_astley.jpg"
    )
  end

  it "uses GET /items to get index of all items" do
    get "/api/v1/items"

    expect(response).to have_http_status(200)

    items = JSON.parse(body)
    expect(items.count).to eq(1)

    item_json = items.first

    expect(item_json).to eq(
      'name'        => @item.name,
      'description' => @item.description,
      'image_url'   => @item.image_url
    )
  end

  it "uses GET '/items/:id' to get specific item" do
    get "/api/v1/items/1"

    expect(response).to have_http_status(200)

    item = JSON.parse(body)

    expect(item).to eq(
      'name'        => @item.name,
      'description' => @item.description,
      'image_url'   => @item.image_url
    )
  end

  it "uses DELETE '/items/:id' to delete specific item" do
    get "/api/v1/items/1"

    expect(response).to have_http_status(204)

    item = JSON.parse(body)

    expect(item).to eq(
      'name'        => @item.name,
      'description' => @item.description,
      'image_url'   => @item.image_url
    )
  end
end
