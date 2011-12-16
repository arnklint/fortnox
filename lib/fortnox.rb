require "httparty"
require "active_support/core_ext/hash"

require "fortnox/version"
require "fortnox/api"
require "fortnox/invoice"
require "fortnox/customer"

module Fortnox
  # Your code goes here...
  class ValidationError < StandardError; end
end
