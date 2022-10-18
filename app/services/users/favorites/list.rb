# frozen_string_literal: true

module Users
  module Favorites
    class List

      def self.call
        new.call
      end

      def call
        [1, 2, 3, 4, 5]
      end

    end
  end
end
