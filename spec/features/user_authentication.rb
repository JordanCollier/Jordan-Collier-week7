require 'rails_helper'

describe 'Users can sign up/in/out' do

  before :each do
    visit "/"
    fill_in "User name", with: 'Jordan'
    fill_in "Password", with: 'password'
    click_button "Create User"
    click_link "Sign Out"

  end

  it "allows user to sign up" do
    fill_in "User name", with: 'John'
    fill_in "Password", with: 'password'
    click_button "Create User"
    expect(page).to have_content "You successfully registered."
  end

  it "allows user to sign in" do
    click_link "Sign In"
    fill_in "User name", with: 'Jordan'
    fill_in "Password", with: 'password'
    click_button "Login"
    expect(page).to have_content "Week 7 and you are still here!"
  end

  it "allows user to sign out" do
    click_link "Sign In"
    fill_in "User name", with: 'Jordan'
    fill_in "Password", with: 'password'
    click_button "Login"
    click_link "Sign Out"
    expect(page).to have_content "Logged out eh? Cya mate!"
  end

end
