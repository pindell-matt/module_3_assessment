require 'rails_helper'

RSpec.describe "user can view an individual store page" do
  it "can click on the name and see the store's location and hours" do
    visit root_path

    within('.search-form') do
      fill_in :zip, with: "80202"
      click_button "search"
    end

    expect(current_path).to eq('/search')

    expect(page).to have_content("17 Total Stores")

    first_store    = "Best Buy Mobile - Cherry Creek Shopping Center"
    first_store_id = 76

    within('.stores') do
      click_link first_store
    end

    within('.location') do
      expect(page).to have_content("Address: Denver, CO 80206")
    end

    within('.hours') do
      expect(page).to have_content("Mon: 10am-9pm")
      expect(page).to have_content("Tues: 10am-9pm")
      expect(page).to have_content("Wed: 10am-9pm")
      expect(page).to have_content("Thur: 10am-9pm")
      expect(page).to have_content("Fri: 10am-9pm")
      expect(page).to have_content("Sat: 10am-9pm")
      expect(page).to have_content("Sun: 11am-7pm")
    end
  end
end
