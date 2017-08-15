require 'rails_helper'

RSpec.feature "Calculations", type: :feature do
  scenario "User views calc page" do
    visit "/calc"
    expect(page).to have_text("Rails Calc")
  end

  scenario "User fills out form and clicks submit" do
    visit "/calc"
    fill_in "problem", :with => "2 ** 16"
    click_button "Compute"
    expect(page).to have_text("65536")
    # save_and_open_page
  end

  scenario "User clears history" do
    visit "/calc"
    fill_in "problem", :with => "2 ** 16"
    click_button "Compute"
    click_button "Delete"
    expect(page).to have_no_text("65536")
    # save_and_open_page
  end
end
