# Poker Checker

Poker Checker is a simple app that will take in your 5 cards and evaluate the value of their value compared to other poker hands.


## Setup

In order to run this application, you'll need to do the following:
1. clone this repository
2. `bundle install` 
3. `bundle exec rake db:setup`
4. `rails server`
5. navigate to `localhost:3000` in your web browser

NOTE: This application was built using Ruby 2.6.6

## Additional Information

Given the scope of this project, no validations were used. Normally I would validate using something like Dry-Validation gem

All of the logic exists in `lib/card_evaluator.rb`. 