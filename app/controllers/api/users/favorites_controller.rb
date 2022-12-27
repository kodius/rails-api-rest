# frozen_string_literal: true

module Api
  module Users
    class FavoritesController < ApplicationController

      before_action :authenticate_user!

      def index
        render json: favorites_list
      end

      def create
        render ::Users::Favorites::Add.call(favorites_params)
      end

      private

      def favorites_list
        ::Users::Favorites::List.call
      end

      def favorites_params
        params.require(:favorite).permit(:article_id, :user_id)
      end

    end
  end
end
