module Fortnox
  class API
    include HTTParty

    cattr_reader :xml

    base_uri  'https://kund2.fortnox.se/ext/'
    format    :xml

    debug_output $stdout

    def self.establish_connection(opts={})
      @@token     = opts[:token]    ||= ENV['fortnox_token']
      @@database  = opts[:database] ||= ENV['fortnox_database']
    end

    def self.connection
      { :token => @@token, :db => @@database }
    end

    def self.run(method, call, attributes={})
      self.send method, "/#{call.to_s}.php", :query => query_params(attributes[:query]),
                                             :body  => { :xml => build_xml(attributes) }
    end

    def self.build_xml(attributes)
      @@xml = attributes.to_xml(:root => attributes.delete(:root), :indent => 2)
    end

    private

    def self.query_params(params)
	    params = params.nil? ? {} : params
	    params.merge(connection)
    end
  end
end
