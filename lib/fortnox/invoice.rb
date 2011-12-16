module Fortnox
  class Invoice < API
    class << self
      def create(attributes={})
        run :post, :set_invoice, attributes
      end
      
      def update(id, attributes={})
      end
    end
  end
end
