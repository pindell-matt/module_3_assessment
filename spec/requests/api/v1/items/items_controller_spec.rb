require 'rails_helper'

RSpec.describe "Api::V1::ItemsController Endpoint", type: :request do

  it "uses GET /items to get index of all items" do
    get "/api/v1/items"

    expect(response).to have_http_status(200)

    items = JSON.parse(body)
    # expect(items.count).to eq(1)
    item_json = items.first

    # serializer for removing created/updated_at

    # When I send a GET request to /api/v1/items
    # I receive a 200 JSON response containing all items
    #   And each item has a name, description,
    #   and image_url but not the created_at or updated_at
  end
end
