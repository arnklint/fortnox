# Ruby Wrapper for the Fortnox API

It currently has tested wrappers for two "resources", namely Invoice and
Customer, please look at the specs to see what functionality it
provides. Since Fortnox (as of now) only provides API documentation per
PDF, we hope to keep this up to date as good as possible.

## Contribute to the project
Clone this repository and change what you want, add tests for it, then run the tests with
`rspec` to make sure they pass. Pull requests are much appriciated and
cheers to the repository creators [Jonas
Arnklint](http://twitter.com/arnklint) [[blog](http://arnklint.com)] and [Kevin
Sjöberg](http://twitter.com/kevinsjoberg) is almost as good!

## Notes
* Based on HTTParty
* For Fortnox Invoicing and Fortnox Customers

## Testing
* RSpec
* Fakeweb/VCR

## Additional notes
* Som det fungerar nu är det Fortnox::Invoice.create .update .destroy som gäller
* Du får ett ID tillbaka när det gick bra annars false.
* ID behövs användas för att exempelvis uppdatera.
* Värt att notera är att när du lägger till en kontakt på en faktura är det inte ID du får när du skapar en kontakt som gäller, ID då är kundnr.
