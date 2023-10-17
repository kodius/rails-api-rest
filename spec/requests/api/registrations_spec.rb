require 'swagger_helper'

RSpec.describe 'api/registrations', type: :request do
  path '/api/sessions/sign-up' do
    post('create registration') do
      tags 'Sessions'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        '$ref' => '#/components/schemas/SessionsSignUpPayload'
      }

      response(200, 'successful') do
        let(:email) { 'info@kodius.com' }
        let(:password) { 'test,pass' }
        let(:password_confirmation) { 'test,pass' }

        let(:user) do
          {
            email:,
            password:,
            password_confirmation:
          }
        end

        run_test!
      end

      response(422, 'Unprocessable Entity') do
        let(:email) { 'infodius.com' }
        let(:password) { 'rudsa,actv' }
        let(:password_confirmation) { 'ruda,actv' }

        let(:user) do
          {
            email:,
            password:,
            password_confirmation:
          }
        end

        run_test!
      end
    end
  end
end
