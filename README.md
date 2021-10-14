# Poker Checker

Supply a space-separated list of 5 cards (eg 2H 5C 7D 10S QH) and find out what sort of poker hand it is!

## Setup

Once you have opened the directory, run the following commands in your terminal:

1.  `bin/setup`
2.  `rails server`

Once the server is running, navigate to `localhost:3000` in your web browser and submit your poker hand. Click "Create a new hand" to try again

To run the unit tests, copy this command into your terminal window:

`bundle exec rspec spec/unit/lib/card_evaluator_spec.rb`

NOTE: This application was built using Ruby 2.6.6 and postgresql
