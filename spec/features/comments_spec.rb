require 'spec_helper'

describe 'comments' do
  
  before :each do
    user = FactoryGirl.create(:user)
    user.confirm!

    visit '/login'
    fill_in "username", :with => user.username
    fill_in "password", :with => user.password 
    click_button "Log In"
    @image = FactoryGirl.create(:image)
  end
  
  it 'should allow a user to add a comment' do
    visit image_path(@image.id)
    fill_in "comment_content", with: "This is awesome!"
    click_button "Add comment"
    page.should have_content "This is awesome!"
  end   
end  