# frozen_string_literal: true

module Concerns
  module ByEmail
    def by_email(email)
      where(email:)
    end
  end
end
