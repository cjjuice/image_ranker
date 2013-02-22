require 'spec_helper'

describe "image submission" do
  
  before :each do
    user = FactoryGirl.create(:user)

    visit '/login'
    fill_in "email", :with => user.email
    fill_in "password", :with => user.password 
    click_button "Log In"
  end
  
  it "allows users to submit images" do
    image = 'http://8.mshcdn.com/wp-content/uploads/2012/09/nook-hd-plus-640.jpg'
    
    visit new_image_path
    fill_in 'image_url', :with => image
    click_button 'submit'
   end
   
end  