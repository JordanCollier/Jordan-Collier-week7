require 'rails_helper'

describe 'Users can sign up/in/out' do

  before :each do
    visit "/"
    fill_in "User name", with: 'Jordan'
    fill_in "Password", with: 'password'
    click_button "Create User"
    click_on "Check out some Courses"
    click_on "Create Course"
    fill_in "Title", with: "History"
    click_on "Create Course"
    expect(page).to have_content 'Yeah the course was created.'
  end


 it "can create a course" do
   click_on "Create Course"
   click_on "Create Course"
   expect(page).to have_content "1 error prohibited this user from being saved:"
   fill_in "Title", with: "Science"
   click_on "Create Course"
   expect(page).to have_content 'Yeah the course was created.'
 end

 it "allows course to have show page" do
   click_on "History"
   expect(page).to have_content "History"
 end

 it "can edit a course" do
   click_on "Edit"
   fill_in "Title", with: "Math"
   click_button "Update Course"
   expect(page).to have_content "Updated like a fresh coat of paint."
 end

 it "can destroy a course" do
   click_on "Delete"
   expect(page).to have_content "Course was deleted my good sir"
 end


end
