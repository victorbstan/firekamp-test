# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/artworks', type: :request do
  fixtures :all

  path '/api/v1/artworks' do
    get('list artworks') do
      tags 'artworks'
      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{generate_token_for_user(1)}" }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'unauthorized') do
        let(:Authorization) {}
        run_test!
      end
    end
  end

  path '/api/v1/artworks/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show artwork') do
      tags 'artworks'
      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{generate_token_for_user(1)}" }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'unauthorized') do
        let(:Authorization) {}
        let(:id) { 123 }
        run_test!
      end
    end
  end

  path '/api/v1/artworks/search/{search_term}' do
    parameter name: 'search_term', in: :path, type: :string, description: 'search term'

    get('search artwork') do
      tags 'artworks'
      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{generate_token_for_user(1)}" }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'unauthorized') do
        let(:Authorization) {}
        let(:search_term) { 'test' }
        run_test!
      end
    end
  end

  path '/api/v1/artworks/favorite' do
    post('favorites artwork') do
      tags 'artworks'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :favorite_info,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    artwork_id: { type: :integer }
                  },
                  required: %w[artwork_id]
                }

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{generate_token_for_user(1)}" }
        let(:favorite_info) { { artwork_id: 1 } }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'unauthorized') do
        let(:Authorization) {}
        let(:favorite_info) { { artwork_id: 1 } }
        run_test!
      end
    end
  end
end
