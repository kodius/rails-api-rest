require 'swagger_helper'

describe 'Favorites API' do
  path '/api/users/favorites' do
    get 'Retrieves all favorites' do
      tags 'Favorites'
      produces 'application/json'

      response '200', 'name found' do
        schema type: 'array', items: { type: 'string' }

        # let(:favorites) { Favorite.create(name: 'foo', status: 'bar', photo_url: 'http://example.com/avatar.jpg').id }
        run_test!
      end
    end

    post 'Creates a favorite' do
      tags 'Favorites'
      consumes 'application/json'
      parameter name: :favorite, in: :body, schema: {
        type: :object,
        properties: {
          article_id: { type: :string },
          user_id: { type: :string }
        },
        required: [ 'article_id', 'user_id' ]
      }

      response '201', 'favorite created' do
        let(:favorite) { { article_id: 1, user_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:favorite) { { user_id: 1 } }
        run_test!
      end
    end
  end
end
