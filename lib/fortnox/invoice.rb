module Fortnox
  class Invoice < API
    class << self
      def create(attributes={})
        run :post, :set_invoice, attributes
      end
    end
  end
end
