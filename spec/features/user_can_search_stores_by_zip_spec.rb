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

    expect(page).to have_content("17 Total Stores")

    first_store = "Best Buy Mobile - Cherry Creek Shopping Center: Denver, 3.25, 303-270-9189, Mobile"
    last_store  = "Best Buy - S.E. Aurora: Aurora, 18.51, 303-693-0166, BigBox"

    within('.stores') do
      expect(page).to have_content(first_store)
      expect(page).to have_content(last_store)
    end

  end
end
