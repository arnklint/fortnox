require 'spec_helper'

module Fortnox
  describe Customer do
    before(:each) { API.establish_connection }

    it "should create customer and return it's id" do
      VCR.use_cassette('customer/create') do
        customer_id = Customer.create(fixtures(:invoice)["contact"])
        customer_id.should be_a(Integer)
      end
    end

    it "should update customer given by id and return it's id" do
      VCR.use_cassette('customer/update') do
        customer_id = Customer.update(fixtures(:invoice)["contact"].merge(:name => 'Example Customer'))
        customer_id.should be_a(Integer)
        customer_id.should eq(1)
      end
    end
  end
end
