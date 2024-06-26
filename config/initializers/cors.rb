# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '/api/v1',
             headers: :any,
             methods: %i[get post patch put delete],
             expose: %w[Authorization]
  end
end
