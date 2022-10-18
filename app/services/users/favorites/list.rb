# frozen_string_literal: true

module Users
  module Favorites
    class List

      def self.call
        new.call
      end

      def call
        # would usually be logic for returning objects from the database, e.g.
        # Core::Queries::User.all
        [1, 2, 3, 4, 5]
      end

    end
  end
end
