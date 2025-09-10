RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Warden::Test::Helpers
  config.after(type: :request) { Warden.test_reset! }
end

Warden.test_mode!
