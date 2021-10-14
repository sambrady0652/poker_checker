# Poker Checker

Poker Checker is a simple app that will take in your 5 cards and evaluate what sort of poker hand it is.

## Setup

In order to run this application, you'll need to do the following:

1. clone this repository
2. `bundle install`
3. `bundle exec rake db:setup`
4. `rails server`
5. navigate to `localhost:3000` in your web browser
6. Run the unit tests with `bundle exec rspec spec/unit/lib/card_evaluator_spec.rb`

NOTE: This application was built using Ruby 2.6.6
