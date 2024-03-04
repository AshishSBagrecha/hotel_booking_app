# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'  # Allows requests from any origin
      resource '*',  # Allows requests to any path
        headers: :any,  # Allows requests with any headers
        methods: [:get, :post, :put, :patch, :delete, :options, :head]  # Allows specified HTTP methods
    end
  end
  