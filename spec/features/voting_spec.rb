require 'spec_helper'

describe "image voting" do
  
  before :each do
    image = FactoryGirl.create(:image)
    image2 = FactoryGirl.create(:image, image_url: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn1/368735_1533227324_882638921_n.jpg")
  end  
end