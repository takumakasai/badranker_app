Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3001',
            'badranker-app.onrender.com',
            'badranker-app-api.onrender.com'
    resource '*',
      headers: :any,
      methods: [:get, :post, :patch, :put, :delete, :options, :head],
      # credentials: true
      credentials: false
  end
end
