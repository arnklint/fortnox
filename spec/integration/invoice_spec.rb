require 'spec_helper'

module Fortnox
  describe Invoice do
    before(:each) { API.establish_connection }

    it "should create invoice and return it's id" do
      VCR.use_cassette('invoice/create') do
        invoice_no = Invoice.create(fixtures(:invoice))
        invoice_no.should be_a(Integer)
      end
    end

    it "should update invoice given by id and return it's id" do
      VCR.use_cassette('invoice/update') do
        invoice_no = Invoice.update(fixtures(:invoice).merge(:ourref => 'Foo Foo'))
        invoice_no.should be_a(Integer)
        invoice_no.should eq(1)
      end
    end

    it "should destroy invoice given by id and return it's id" do
      VCR.use_cassette('invoice/destroy') do
        invoice_no = Invoice.destroy(1)
        invoice_no.should be_a(Integer)
        invoice_no.should eq(1)
      end
    end
  end
end
