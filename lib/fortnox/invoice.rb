module Fortnox
  class Invoice < API
    class << self
      def create(attributes={})
        run :post, :set_invoice, with_root(attributes)
      end
      
      def update(attributes={})
	      run :post, :set_invoice, with_root(attributes)
      end

      def destroy(id)
        run :post, :set_invoice_cancel, { :query => { :id => id } }
      end
      
      private
      
      def with_root(attributes)
	      attributes.merge(:root => :invoice)
	    end
    end
  end
end
