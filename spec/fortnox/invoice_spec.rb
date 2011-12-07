require "spec_helper"

module Fortnox
  describe Invoice do
    before do
      @valid = FactoryGirl.attributes_for(:invoice)
    end

    it "is created" do
      invoice = Invoice.create(@valid)
      invoice.should_not raise_error
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
