# frozen_string_literal: true

require 'swagger_helper'

describe 'api/v1/users', type: :request do
  fixtures :all

  path '/api/v1/register' do
    post('create user') do
      tags 'authentication'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :register_info,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    email: { type: :string },
                    password: { type: :string }
                  },
                  required: %w[email password]
                }

      response(200, 'successful') do
        let(:Authorization) {}

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end

  path '/api/v1/login' do
    post('login user') do
      tags 'authentication'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :login_info,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    email: { type: :string },
                    password: { type: :string }
                  },
                  required: %w[email password]
                }

      response(200, 'successful') do
        let(:Authorization) {}
        let(:login_info) { { email: 'bob@test.com', password: '123456' } }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end
end
