require "fortnox"

# days in the future formatted to fortnox date string
def future( days )
  (Time.now + days * 86400).strftime("%Y-%m-%d")
end

