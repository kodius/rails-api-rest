# Queries

Extracting the logic used to select records to query objects helps us keep our models "skinny".

This means keeping as much logic out of them as possible so that they deal only with persistence.

## Good

All code that results in a SELECT SQL query to the database is triggered by calling a named scope contained inside an appropriate query class. This query class lives in `app/services/core/queries/model_name.rb` or `app/services/<your_service>/queries/model_name.rb`

```ruby
module Core
  module Queries
    class Letter < Query

      set_model ::Letter

      module Scopes
        def updated_after(date)
          where('letters.updated_at > ?', date)
        end
      end
    end
  end
end

Core::Queries::Letter.updated_after(Date.current)
```

## Not good

Defining a scope or query method on a model.

```ruby
class Letter < ApplicationRecord
  scope :updated_after, -> (date) { where('letters.updated_at > ?', date) }
end

Letter.updated_after(Date.current)
```

## Detail

Queries aren't in their own subdirectory, but are a "pattern" we use to place all of the queries we use to retrieve data into a single logical structure.

Queries are stored in two places in the codebase:

* Core queries, which sit in the core service (`app/services/core/queries`) that are shared across all the other services.
* Queries used just for a single service, in which case they sit inside the service itself. These nearly always "extend" a core query.

Core queries are used cross-application for common search behaviours, like "give me all contributions for this employer". They're isolated from queries we need specifically for a single requirement, which live inside the service which needs them.

app/services/create_contribution/queries/letter.rb:

```ruby
# frozen_string_literal: true

module CreateContribution
  module Queries
    class Letter < Core::Queries::Letter

      module Scopes
        def created_at_after_or_on(on)
          where('letters.created_at >= ?', on)
        end
      end

    end
  end
end
```

Extending Core::Queries::Letter like this means that the action of a given service can call its internal Queries::Letter directly, using default scopes, but also using scopes freshly written as needed for that specific service.
