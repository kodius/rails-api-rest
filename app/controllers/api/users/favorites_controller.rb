# frozen_string_literal: true

module Api
  module Users
    class FavoritesController < ApplicationController

      def index
        render json: { favorites: [1, 2, 3, 4] }
      end

      def create
        render json: { favorite: { article_id: request.params[:article_id], user_id: request.params[:user_id] } }
      end

    end
  end
end
