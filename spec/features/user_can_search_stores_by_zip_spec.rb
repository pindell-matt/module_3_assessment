require 'rails_helper'

RSpec.describe "user can search for closest stores with their zip code" do
  it "can enter zip code into search form" do
  # VCR.use_cassette("search/zip") do
  
    visit root_path

    within('.search-form') do
      fill_in :zip, with: "80202"
      click_button "search"
    end

    expect(current_path).to eq('/search')

    expect(page).to include("17 Total Stores")

  end
end
