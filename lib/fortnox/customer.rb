module Fortnox
  class Customer < API
    class << self
      def create(attributes={})
        run :post, :set_contact, with_root(attributes)
      end

      def update(attributes={})
        run :post, :set_contact, with_root(attributes)
      end

      private

      def with_root(attributes)
        { :contact => attributes }
      end
    end
  end
end
