require "spec_helper"

module Fortnox
  describe Invoice do
    let(:attributes) { {:id => 1, :ourref => 'Foo Bar', :yourref => 'Bar Foo'} }

    before :each do
      Invoice.stub(:run) { {'result' => {'id' => '2'}} }
    end
    
    it "makes a post request and return an integer" do
      invoice_number = Invoice.create(attributes)
      invoice_number.should be_a(Integer)
    end

    it "makes a post request and dismisses specified id" do
      Invoice.should_receive(:run).with(:post, :set_invoice, {:invoice => attributes.reject { |k,v| k == :id }})
      invoice_number = Invoice.create(attributes)
      invoice_number.should_not eq(attributes[:id])
    end

    it "makes a post request and preserves specified id" do
      Invoice.should_receive(:run).with(:post, :set_invoice, {:invoice => attributes})
      Invoice.update(attributes)
    end

    it "makes a post request with query parameter id" do
      Invoice.should_receive(:run).with(:post, :set_invoice_cancel, {:query => {:id => 2}})
      Invoice.destroy(2)
    end
  end
end
