# What is a service?

Services are the main architectural pattern in use in our Rails-based API projects. 

Services help segregate the application to isolate changes required for individual features into small, testable fragments of code.

Not having a massive "core" of controllers, models and views with all the logic shared between the functionality means many developers can work on many different features at once without treading on each others toes.

It allows us to unit test far more of our codebase than we would be able to do within the Rails framework -- moving the logic out into POROs (Plain Old Ruby Objects) helps us keep our test suite fast and comprehensive.

## When should I create a new service?

Always default to creating a new service when adding functionality.

However, if this functionality is _clearly_ an implementation detail of an existing service, you can extend the existing service.

### Good

Separate services for each logical piece of behavior:

```
app/
  services/
    create_investment/
      create_buy_investment.rb
      create_sell_investment.rb
    handle_investment_callback/
    price_investment/
```

### Not good

A single "god" unit which implements many behaviors:

```
app/
  services/
    manage_investment/
      create_buy_investment.rb
      delete_buy_investment.rb
      create_sell_investment.rb
      delete_sell_investment.rb
      record_investment_priced.rb
      handle_investment_callback.rb
```
