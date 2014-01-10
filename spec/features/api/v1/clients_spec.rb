require 'spec_helper'

describe "clients API", type: :api do
  let(:user) { FactoryGirl.create(:user) }

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
    token = body["access_token"]
    @authorization = { "HTTP_AUTHORIZATION" => "Bearer #{token}" }
  end

  describe "index" do
    before do
      user.clients << FactoryGirl.build(:client)
      user.clients << FactoryGirl.build(:client)
    end

    it "should return each client" do
      get "/api/v1/clients.json", {}, @authorization

      serializer = ActiveModel::ArraySerializer.new(user.clients, each_serializer: ClientSerializer)
      expect(last_response.status).to eq(200)
      expect(serializer.to_json).to eql(last_response.body)
    end
  end

  describe "show" do
    let(:client) { FactoryGirl.build(:client) }

    before { user.clients << client }

    it "should return the requested client" do
      get "/api/v1/clients/#{client.id}.json", {}, @authorization

      serializer = ClientSerializer.new client
      expect(last_response.status).to eql(200)
      expect(serializer.to_json).to eql(last_response.body)
    end
  end

  describe "create" do
    it "creates a new client for the user" do
      body = {
        client: {
          name:         "Test Client",
          email:        "client@example.com",
          company_name: "Test Company"
        }
      }
      post "/api/v1/clients.json", body, @authorization

      client = Client.last
      serializer = ClientSerializer.new client
      expect(last_response.status).to eql(201)
      expect(serializer.to_json).to eql(last_response.body)
    end
  end

  describe "update" do
  end

  describe "delete" do
  end
end
