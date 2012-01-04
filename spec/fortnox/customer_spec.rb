require "spec_helper"

module Fortnox
  describe Customer do
    let :attributes do
      {
        :id         => 1,
        :name       => 'Example AB',
        :address    => 'Example street',
        :city       => 'Example',
        :zip        => '123 45',
        :pricelist  => 'A'
      }
    end
    
    it "makes a post request and dismisses specified id" do
      Customer.stub(:run) { { 'result' => { 'id' => '2' } } }

      Customer.should_receive(:run).with(:post, :set_contact, { :contact => attributes.reject { |k, v| k == :id } })
      customer_number = Customer.create(attributes)

      customer_number.should_not eq(attributes[:id])
    end

    it "makes a post request and preserves specified id" do
      Customer.stub(:run) { {'result' => {'id' => '1'}} }

      Customer.should_receive(:run).with(:post, :set_contact, {:contact => attributes})
      customer_number = Customer.update(attributes)
    end
  end
end
