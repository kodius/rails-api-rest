# What is an Action Interactor?

Actions are *interactors* the main architectural pattern in use in our Rails-based API projects. 

The key word here is *interactor*. They're meant for logic that is easily identifiable by a user -- logic that they *know* exists.

Actions help segregate the application to isolate changes required for individual *interacting* features into small, testable fragments of code.

Not having a massive "core" of controllers, models and views with all the logic shared between the functionality means many developers can work on many different features at once without treading on each others toes.

It allows us to unit test far more of our codebase than we would be able to do within the Rails framework -- moving the logic out into POROs (Plain Old Ruby Objects) helps us keep our test suite fast and comprehensive.

## How is this different than a Service?

We still use Service objects, they're setting in the usual places over at `app/services`, except we use them only for logic that's not supposed to be known to users. They're not part of the business domain but rather technicalities.

## When should I create a new Action Interactor?

Always default to creating a new Action when adding functionality.

However, if this functionality is _clearly_ an implementation detail of an existing Action, you can extend the existing Action.

### Good

Separate Actions for each logical piece of behavior:

```
app/
  interactors/
    actions/
      users/
        onboard_user.rb
        offboard_user.rb
      reports/
        create_excel_file.rb
```

### Not good

A single "god" Action unit which implements many behaviors:

```
app/
  interactors/
    actions/
      manage_investment/
        create_buy_investment.rb
        delete_buy_investment.rb
        create_sell_investment.rb
        delete_sell_investment.rb
        record_investment_priced.rb
        handle_investment_callback.rb
```
