require "fortnox"
require "vcr"

# days in the future formatted to fortnox date string
def future(days)
  (Time.now + days * 86400).strftime("%Y-%m-%d")
end

VCR.config do |c|
  c.default_cassette_options = {:match_requests_on => [:method, :uri, :body]}
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.stub_with :webmock
end
