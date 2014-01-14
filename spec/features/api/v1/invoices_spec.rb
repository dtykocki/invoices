require 'spec_helper'

describe "invoices API" do
  let(:user)    { FactoryGirl.create(:user) }
  let(:client)  { FactoryGirl.build(:client) }
  let(:auth)    { Authentication.generate_auth(user) }

  before { user.clients << client }

  describe "index" do
    before do
      client.invoices << FactoryGirl.build(:invoice)
      client.invoices << FactoryGirl.build(:invoice)
    end

    it "should return each invoice for the client" do
      get "/api/v1/clients/#{client.id}/invoices.json", {}, auth

      serializer = ActiveModel::ArraySerializer.new(client.invoices, each_serializer: InvoiceSerializer)
      expect(last_response.status).to eql(200)
      expect(last_response.body).to eql(serializer.to_json)
    end
  end
end
