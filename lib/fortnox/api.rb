module Fortnox
  class API
    include HTTParty

    base_uri 'https://kund2.fortnox.se/ext/'
  end
end
