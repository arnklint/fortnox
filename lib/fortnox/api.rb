module Fortnox
  class API
    include HTTParty

    base_uri  'https://kund2.fortnox.se/ext/'
    format    :xml

    debug_output $stdout

    def self.establish_connection(opts={})
      @@token     = opts[:token]    ||= ENV['token']
      @@database  = opts[:database] ||= ENV['database']
    end

    def self.connection
      { :token => @@token, :db => @@database }
    end

    def self.run(method, call, attributes={})
	    xml = attributes.to_xml(:root => attributes.delete(:root), :indent => 2)
      self.send method, "/#{call.to_s}.php", :query => query_params(attributes[:query]), :body => { :xml => xml }
    end

    private

    def self.query_params(params)
	    params = params.nil? ? {} : params
	    params.merge(connection)
    end
  end
end