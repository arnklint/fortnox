module Fortnox
  class API
    include HTTParty

    base_uri  'https://kund2.fortnox.se/ext/'
    format    :xml

    class << self
      def establish_connection(opts={})
        @@token = opts[:token] || ENV['fortnox_token']
        @@database = opts[:database] || ENV['fortnox_database']
        @@query_parameters = connection
      end

      def connection
        { :token => @@token, :db => @@database }
      end

      def run(method, call, attributes={})
        self.query_parameters = attributes[:query] if attributes[:query]
        self.send(method, "/#{call.to_s}.php", {
          :query  => query_parameters,
          :body   => {:xml => build_xml(attributes)}
        })
      end

      def query_parameters
        @@query_parameters
      end

      def query_parameters=(params={})
        @@query_parameters = query_parameters.merge(params)
      end

      private

      def build_xml(attributes)
        attributes.delete(:query) if attributes[:query]
        @@xml = Gyoku.xml(attributes)
      end
    end
  end
end
