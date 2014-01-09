require 'spec_helper'

describe "Clients API", type: :api do
  let(:user)      { FactoryGirl.create(:user) }

  before do
    app = create_client_app(user)
    params = {
      username:       user.email,
      password:       user.password,
      client_id:      app.client_id,
      client_secret:  app.client_secret,
      grant_type:     "password"
    }
    post "oauth/token.json", params
    body  = JSON.parse(last_response.body)
    @token = body["access_token"]
  end

  describe "index" do
    before do
      user.clients << FactoryGirl.build(:client)
      user.clients << FactoryGirl.build(:client)
    end

    it "should return each client" do
      get "/api/v1/clients.json", {}, { "HTTP_AUTHORIZATION" => "Bearer #{@token}" }

      expect(last_response.status).to eq(200)
      clients = JSON.parse(last_response.body)
      expect(clients.length).to eq(2)
    end
  end

  describe "create" do
  end

  describe "update" do
  end

  describe "delete" do
  end
end
