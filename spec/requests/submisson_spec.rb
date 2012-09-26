require 'spec_helper'

describe "image submission" do
  
  it "allows users to submit images" do
       image = 'http://8.mshcdn.com/wp-content/uploads/2012/09/nook-hd-plus-640.jpg'
    
        visit new_image_path
        fill_in 'image_url', :with => image
        click_button 'submit'
        
        expect(page).to have_selector("ul li a img")
   end
   
end  