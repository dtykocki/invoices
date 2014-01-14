require 'spec_helper'

describe "clients API", type: :api do
  let(:user) { FactoryGirl.create(:user) }
  let(:auth) { Authentication.generate_auth(user) }

  describe "index" do
    before do
      user.clients << FactoryGirl.build(:client)
      user.clients << FactoryGirl.build(:client)
    end

    it "should return each client" do
      get "/api/v1/clients.json", {}, auth

      serializer = ActiveModel::ArraySerializer.new(user.clients, each_serializer: ClientSerializer)
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eql(serializer.to_json)
    end
  end

  describe "show" do
    let(:client) { FactoryGirl.build(:client) }
    before { user.clients << client }

    it "should return the requested client" do
      get "/api/v1/clients/#{client.id}.json", {}, auth

      serializer = ClientSerializer.new client
      expect(last_response.status).to eql(200)
      expect(last_response.body).to eql(serializer.to_json)
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
      post "/api/v1/clients.json", body, auth

      client = Client.last
      serializer = ClientSerializer.new client
      expect(last_response.status).to eql(201)
      expect(last_response.body).to eql(serializer.to_json)
    end
  end

  describe "update" do
    let(:client) { FactoryGirl.build(:client) }

    before { user.clients << client }

    it "updates the specified client" do
      body = {
        client: {
          name:         "Updated Client",
          email:        "updated@example.com",
          company_name: "Updated Company"
        }
      }
      put "/api/v1/clients/#{client.id}.json", body, auth

      expect(last_response.status).to eql(204)
    end
  end

  describe "delete" do
    let(:client) { FactoryGirl.build(:client) }
    before { user.clients << client }

    it "deletes the specified client" do
      delete "/api/v1/clients/#{client.id}.json", {}, auth

      expect(last_response.status).to eql(204)
    end
  end
end
