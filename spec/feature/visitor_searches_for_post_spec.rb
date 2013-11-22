require 'spec_helper'

feature "Visitor searches for post" do

  scenario "when signing up" do

    visit "/users/new"
    fill_in "Name", :with => "jill"
    fill_in "Email", :with => "skylar@corkerykaulke.org"
    fill_in "Password", :with => "jams"
    click_button "signup"

      expect(page).to have_text("My Post")
  end
end


