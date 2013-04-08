require 'spec_helper'

describe "Auth" do

   it "allows user to signup for site" do
      visit '/signup'
      fill_in "user_username", :with => 'jbar'
      fill_in "user_email", :with => 'Joe@bar.com' 
      fill_in "user_password", :with => 'secretpassword'
      fill_in "user_password_confirmation", :with => 'secretpassword'
      click_button "sign_up"	
    end


    it "allows user to login to site" do
      
      user = FactoryGirl.create(:user)
      user.confirm!
    
      visit '/login'
      fill_in "username", :with => user.username
      fill_in "password", :with => user.password 
      click_button "Log In"
      expect(page).to have_selector(".navbar", :text => user.username)	
    end


    it "allows user to logout to site" do
      
      user = FactoryGirl.create(:user)
      user.confirm!
      
      visit '/login'
      fill_in "username", :with => user.username
      fill_in "password", :with => user.password 
      click_button "Log In" 
      visit '/logout'
      expect(page).to have_no_selector(".navbar", :text => user.username)	
    end

end