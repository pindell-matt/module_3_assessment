require 'rails_helper'

RSpec.describe "user can search for closest stores with their zip code" do
  it "can enter zip code into search form" do
  # VCR.use_cassette("search/zip") do
  # create user

  visit root_path

  within('.search-form') do
    fill_in :zip, with: "80202"
    click_button "search"
  end

  expect(current_path).to eq('/search')

  curl 'https://api.bestbuy.com/v1/products(type=Movie)?format=json&show=sku,name,salePrice&pageSize=3&page=10&apiKey=YourAPIKey'
  curl "https://api.bestbuy.com/v1/stores?format=json&apiKey=qy8vdpfcgsxtfw657mnbu7nc"
  # And I should see stores within 25 miles of 80202
  # And I should see a message that says "17 Total Stores"
  # And I should see exactly 15 results
  # And I should see the long name, city, distance, phone number and store type for each of the 15 results

   end
end
