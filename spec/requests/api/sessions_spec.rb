require 'swagger_helper'

RSpec.describe 'api/sessions', type: :request do
  path '/api/sessions/login' do
    post('create session') do
      tags 'Sessions'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        '$ref' => '#/components/schemas/SessionsLoginPayload'
      }
      response(200, 'successful') do
        schema '$ref' => '#/components/schemas/SessionsLoginResponse'
        let(:created_user) { create(:user) }

        let(:user) do
          {
            email: created_user.email,
            password: created_user.password
          }
        end

        run_test!
      end

      response(401, :unauthorized) do
        let(:created_user) { create(:user) }
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: %w[error]

        let(:user) do
          {
            email: created_user.email,
            password: 'wrong_password'
          }
        end

        run_test!
      end
    end
  end
end
