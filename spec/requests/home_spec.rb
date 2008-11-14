require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/home/rps_calc" do
  
  it "should return 100 RPS for a input of 8.64 million" do
    request("/home/rps_calc", :params => {:rpd => 8_640_000}).should contain('100')
  end

  it "should show an error message if RPD is < 86,400" do
    request("/home/rps_calc", :params => {:rpd => 86399}).should have_selector('div#error')
  end

  it "should handle numbers with commas in them" do
    request("/home/rps_calc", :params => {:rpd => '8,640,000'}).should contain('100')
  end

  it "should show the RPD and RPS" do
    request("/home/rps_calc", :params => {:rpd => '8,640,000'}).should contain('8,640,000')
  end
  
  it "should redirect to / if request is a GET" do
    request("/home/rps_calc").should redirect
  end
end