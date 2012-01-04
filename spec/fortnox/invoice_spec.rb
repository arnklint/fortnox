# -*- encoding: utf-8 -*-

require "spec_helper"

module Fortnox
  describe Invoice do
    before :all do
      Fortnox::API.establish_connection
    end

    let :attributes do
      {
        :id         => 1,
        :tdate      => future(0),        :ddate      => future(30),        :edate      => future(30),        :ourref     => 'Foo Bar',        :yourref    => 'Bar Foo',        :roundoff   => 1,        :freight    => 0,        :totalvat   => 50,        :total      => 250,
        :contact    => {
          :id       => 1,
          :name     => 'Example AB',
          :address  => 'Example street',
          :city     => 'Example',
          :zip      => '123 45'
        },
        :invoicerows  => [
          {
            :invoicerow => {
              :descr    => 'Sample product',              :price    => 100,              :amount   => 2,              :vat      => 25
            }
          }
        ]
      }
    end      
    
    it "should create invoice" do
      invoice = Invoice.create(attributes)

      invoice.parsed_response.should_not include("error")
      invoice.parsed_response.should include("result")
    end
    
    it "it should update invoice" do
      new_attributes  = attributes.merge(:id => 1, :ourref => 'Bar Foo', :yourref => 'Foo Bar')
      invoice         = Invoice.update(new_attributes)

      invoice.parsed_response.should_not include("error")
      invoice.parsed_response.should include("result")
    end

    it "it should destroy invoice" do
      invoice = Invoice.destroy(1)
      invoice.parsed_response.should_not include("error")
      invoice.parsed_response.should include("result")
    end
  end
end
