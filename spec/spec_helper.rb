require "fortnox"


# days in the future formatted to fortnox date string
def future( days )
  (Time.now + days * 8400).strftime("%Y-%m-%d")
end

