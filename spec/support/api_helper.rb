module ApiHelper
  include Rack::Test::Methods

  def app
    Rails.application
  end

  RSpec.configure do |c|
    c.include ApiHelper
  end
end
