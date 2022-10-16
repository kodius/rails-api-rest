# frozen_string_literal: true

module Api
  module Users
    class FavoritesController < ApplicationController

      def index
        render json: { favorites: [1, 2, 3, 4] }
      end

    end
  end
end
