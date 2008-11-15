require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/home/rps_calc" do

  it "should redirect to / if request is a GET" do
    request("/home/rps_calc").should redirect
  end

  it "should convert to RPS by default" do
    request("/home/rps_calc", :params => {:requests_per => 8_640_000}).should contain('reqs/day is 100 reqs/sec')
  end

  it "should handle numbers with commas in them" do
    request("/home/rps_calc", :params => {:requests_per => '8,640,000'}).should contain('100')
  end

  describe "converting into RPS" do
    it "should return 100 RPS for a input of 8.64 million" do
      request("/home/rps_calc", :params => {:requests_per => 8_640_000}).should contain('100')
    end

    it "should show an error message if requests_per is < 86,400" do
      request("/home/rps_calc", :params => {:requests_per => 86399}).should have_selector('div#error')
    end
  end

  describe "converting into RPD" do
    it "should return 8.64 million reqs/day for a input of 100 reqs/sec" do
      request("/home/rps_calc", :params => {:requests_per => 100, :convert_to => 'rpd'}).should contain('100 reqs/sec is 8640000 reqs/day')
    end
  end

end