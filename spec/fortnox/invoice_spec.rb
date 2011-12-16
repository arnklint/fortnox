# -*- encoding: utf-8 -*-

require "spec_helper"

module Fortnox
  describe Invoice do
    before :all do
      Fortnox::API.establish_connection
    end

    let :attributes do
      {
	      :root => :invoice,        :tdate      =>  future(0),        :ddate      =>  future(30),        :edate      =>  future(30),        :ourref     =>  'Kevin Sjöberg',        :yourref    =>  'Jonas Arnklint',        :roundoff   =>  1,        :freight    =>  0,        :totalvat   =>  419,        :total      =>  2095,        :contact => {        	:id       =>  1,          :name     =>  'Exempel AB',          :address  =>  'Exempelgatan',          :zip      =>  '000 00',          :city     =>  'Exempel'        },        :invoicerows => [
	        {            :descr  =>  'Gitarr',            :price  =>  21,            :amount =>  50,            :vat    =>  25          },          {            :descr  =>   'Piano',            :price  =>   450,            :amount =>   1,            :vat    =>   25          },          {            :descr  =>   'Trumpet',            :price  =>   176,            :amount =>   1,            :vat    =>   25          }        ]
    	}
    end
    
    it "should create invoice" do
      invoice = Invoice.create(attributes)
      invoice.code.should equal(200)
      invoice.parsed_response.should_not include("error")
      invoice.parsed_response.should include("result")
    end

    it "is destroyed" do
      pending "skip this one"
    end

    describe "Updating" do
	    pending "Skip this one"
    end
  end
end
