require 'spec_helper'

feature "User logs in" do

  scenario "when logging in" do
    user = User.create(name: 'fred', email: "skylar@corkerykaulke.org", password: 'jams')
    visit "/login"
    fill_in "Email", :with => "skylar@corkerykaulke.org"
    fill_in "Password", :with => "jams"
    click_button "login"

      expect(page).to have_text("My Post")
  end
end


