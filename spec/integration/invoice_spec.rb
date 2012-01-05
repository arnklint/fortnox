require 'spec_helper'

module Fortnox
  describe Invoice do
    before(:each) { API.establish_connection }

    it "should create and return an id" do
      VCR.use_cassette('invoice/create') do
        invoice_no = Invoice.create(fixtures(:invoice))
        invoice_no.should be_a(Integer)
      end
    end

    it "should update and return an id" do
      VCR.use_cassette('invoice/update') do
        invoice_no = Invoice.update(fixtures(:invoice))
        invoice_no.should be_a(Integer)
        invoice_no.should eq(1)
      end
    end

    it "should destroy return an id" do
      VCR.use_cassette('invoice/destroy') do
        invoice_no = Invoice.destroy(1)
        invoice_no.should be_a(Integer)
        invoice_no.should eq(1)
      end
    end

    it "should fail to create and return false" do
      VCR.use_cassette('invoice/create-fail') do
        invoice_no = Invoice.create
        invoice_no.should be_false
      end
    end

    it "should fail to update and return false" do
      VCR.use_cassette('invoice/update-fail') do
        invoice_no = Invoice.update
        invoice_no.should be_false
      end
    end

    it "should fail to destroy and return false" do
      VCR.use_cassette('invoice/destroy-fail') do
        invoice_no = Invoice.destroy(2)
        invoice_no.should be_false
      end
    end
  end
end
