require 'rails_helper'

RSpec.feature "Calculations", type: :feature do
  scenario "User views calc page" do
    visit "/calc"
    expect(page).to have_text("calc show")
  end

  scenario "User fills out form and clicks submit" do
    visit "/calc"
    fill_in "problem", :with => "2 ** 16"
    click_button "compute"
    expect(page).to have_text("65536")
    # save_and_open_page
  end

  scenario "User clears history" do
    visit "/calc"
    fill_in "problem", :with => "2 ** 16"
    click_button "compute"
    click_button "delete"
    expect(page).to have_no_text("65536")
    # save_and_open_page
  end
end
