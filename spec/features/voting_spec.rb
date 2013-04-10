require 'spec_helper'

describe "image voting" do
  
  before :each do
    user = FactoryGirl.create(:user)
    user.confirm!
    visit '/login'
    fill_in "username", :with => user.username
    fill_in "password", :with => user.password 
    click_button "Log In"
    
    @image = FactoryGirl.create(:image)
  end  
  
  it "allows for a image to be upvoted" do
    visit root_url
    click_link 'up'
    @image.reputation_for(:votes).to_i.should eql 1
  end  
  
  it "allows for a image to be downvoted" do
    visit root_url
    click_link 'down'
    @image.reputation_for(:votes).to_i.should eql -1
  end  
end