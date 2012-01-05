require "fortnox"
require "vcr"

end

VCR.config do |c|
  c.default_cassette_options = {:match_requests_on => [:method, :uri, :body]}
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.stub_with :webmock
end
