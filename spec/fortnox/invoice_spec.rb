# -*- encoding: utf-8 -*-

require "spec_helper"

module Fortnox
  describe Invoice do
    before :all do
      Fortnox::API.establish_connection(:token => '12961a41b1fab7f93787a56074b5bc7d', :database => '66291')
    end

    let :attributes do
      {        :invoice => {          :tdate      =>  future(0),          :ddate      =>  future(30),          :edate      =>  future(30),          :ourref     =>  'Kevin Sjöberg',          :yourref    =>  'Jonas Arnklint',          :roundoff   =>  1,          :freight    =>  176,          :totalvat   =>  419,          :total      =>  2095,          :contact => {            :id       =>  1,            :name     =>  'Exempel AB',            :address  =>  'Exempelgatan',            :zip      =>  '000 00',            :city     =>  'Exempel'          },          :invoicerows => [            {            :prodno =>  1,            :descr  =>  'Gitarr',            :price  =>  21,            :amount =>  50,            :vat    =>  25            },            {            :prodno =>   2,            :descr  =>   'Piano',            :price  =>   450,            :amount =>   1,            :vat    =>   25            },            {            :prodno =>   3,            :descr  =>   'Trumpet',            :price  =>   176,            :amount =>   1,            :vat    =>   25            }          ]        }
      }
    end
    
    it "should validate requried attributes" do
      Invoice.required :name, :contact => [:name, :address]
      invoice = Invoice.create({})
      invoice.should raise_error(ValidationError)
    end

    it "should create invoice" do
      invoice = Invoice.create(attributes)
      invoice.should_not raise_error
      invoice.code.should equal(200)
    end

    it "is destroyed" do
      pending "skip this one"
    end

    describe "updating" do
      it "requires an id" do
        invalid = @valid.reject { |k, v| k == :id } # without id

        Invoice.update(invalid).should raise_error
        Invoice.update(@valid).should_not raise_error
      end
    end
  end
end
