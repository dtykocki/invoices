require 'oauth2'

module Authentication
  def self.generate_auth(user)
    app = create_client_app user
    params = {
      username:       user.email,
      password:       user.password,
      client_id:      app.client_id,
      client_secret:  app.client_secret,
      grant_type:     "password"
    }

    client = OAuth2::Client.new(app.client_id, app.client_secret) do |b|
      b.request :url_encoded
      b.adapter :rack, Rails.application
    end
    access  = client.password.get_token(user.email, user.password)
    token   = access.token

    { "HTTP_AUTHORIZATION" => "Bearer #{token}" }
  end

  def self.create_client_app(options)
    user = options[:user]
    name = options[:name] 
    Opro::Oauth::ClientApp.create_with_user_and_name(user, name)
  end
end
