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
      self.send method, "/#{call.to_s}.php?#{self.connection_to_param}"
    end

    private

    def self.connection_to_param
      connection.map { |k,v| "#{k}=#{v}" }.join("&")
    end
  end
end
