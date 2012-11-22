module Fortnox
  class Invoice < API
    class << self
      def create(attributes={})
        attributes = attributes.reject { |k,v| k == :id } if attributes[:id]

        response = run :post, :set_invoice, with_root(attributes)
        if response['result']
          return response['result']['id'].to_i
        else
          raise Error, response.body
        end
      end

      def update(attributes={})
        response = run :post, :set_invoice, with_root(attributes)
        response['result'] ? response['result']['id'].to_i : false
      end

      def destroy(id)
        response = run :post, :set_invoice_cancel, { :query => { :id => id } }
        response['result'] ? response['result'].to_i : false
      end

      def show(id)
        response = run :get, :get_invoice, { :query => { :id => id } }
        response['invoice'] ? response['invoice'] : false
      end

      def payed
        response = run :get, :get_invoices, { :query => { :filter => "finalpayed" } }
        response['invoices']['invoice']
      end

      private

      def with_root(attributes)
        { :invoice => attributes }
      end
    end
  end
end
