module Fortnox
  class API
    include HTTParty

    base_uri  'https://kund2.fortnox.se/ext/'
    format    :xml

    debug_output $stdout

    def self.required(*fields)
      @@required = fields
    end

    def self.establish_connection(opts={})
      @@token     = opts[:token]    ||= ENV['token']
      @@database  = opts[:database] ||= ENV['database']
    end

    def self.connection
      { :token => @@token, :db => @@database }
    end

    def self.run(method, call, attributes={})
      raise ValidationErrror if missing_required(attributes)
      self.send method, "/#{call.to_s}.php?#{self.connection_to_param}"
    end

    private

    def self.missing_required(attrs)
      @@required.all? do |field|
        if field.is_a?(Symbol)
          !attrs[field].nil?
        elsif field.is_a?(Hash)
          field.values.include? { |f| attrs[field.keys[0]].include?(f) }
        end
      end
    end

    def self.connection_to_param
      connection.map { |k,v| "#{k}=#{v}" }.join("&")
    end
  end
end
