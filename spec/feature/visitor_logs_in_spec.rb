require 'spec_helper'

feature "User logs in" do
  user = User.create(name: 'fred', email: "skylar@corkerykaulke.org", password: 'jams')

  scenario "when logging in with valid email" do
   log_in_with("skylar@corkerykaulke.org","jams")
    expect(page).to have_text("My Post")
  end

  scenario "when logging in with invalid email" do
    log_in_with("wrong@email.com","jams")
    expect(page).to have_text("Email")
  end

  scenario "when logging in with invalid password and email" do
    log_in_with("wrong@email.com","jamz")
    expect(page).to have_text("Email")
  end

  scenario "when logging in with blank password and email" do
    log_in_with("","")
    expect(page).to have_text("Email")
  end
  def log_in_with(email, password)
    visit "/login"
    fill_in "Email", :with => email
    fill_in "Password", :with => password
    click_button "login"
  end
end


