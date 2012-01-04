require "spec_helper"

module Fortnox
  describe Customer do
    before :all do
      Fortnox::API.establish_connection
    end

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

    it "should create customer" do
      customer = Customer.create(attributes)

      customer.parsed_response.should_not include('errror')
      customer.parsed_response.should include('result')
    end

    it "should update customer" do
      customer = Customer.update(attributes.merge(:name => 'Example Customer AB'))

      customer.parsed_response.should_not include('errror')
      customer.parsed_response.should include('result')
    end
  end
end
