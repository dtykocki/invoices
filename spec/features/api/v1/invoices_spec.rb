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

  describe "show" do
    let(:invoice) { FactoryGirl.build(:invoice) }

    before { client.invoices << invoice }

    it "should return the specified invoice for the client" do
      get "/api/v1/clients/#{client.id}/invoices/#{invoice.id}.json", {}, auth

      serializer = InvoiceSerializer.new invoice
      expect(last_response.status).to eql(200)
      expect(last_response.body).to eql(serializer.to_json)
    end
  end

  describe "create" do
    it "should create an invoice for the specified client" do
      body = {
        invoice: {
          due_date: DateTime.now,
          amount: "1.25",
          status: "Draft"
        }
      }

      post "/api/v1/clients/#{client.id}/invoices.json", body, auth

      invoice = Invoice.last
      serializer = InvoiceSerializer.new invoice
      expect(last_response.status).to eql(201)
      expect(last_response.body).to eql(serializer.to_json)
    end
  end

  describe "update" do
    let(:invoice) { FactoryGirl.build(:invoice) }

    before { client.invoices << invoice }

    it "updates the specified invoice for the client" do
      body = {
        invoice: {
          due_date: DateTime.now,
          amount: "100.00",
          status: "Sent"
        }
      }
      put "/api/v1/clients/#{client.id}/invoices/#{invoice.id}.json", body, auth

      expect(last_response.status).to eql(204)
    end
  end

  describe "destroy" do
    let(:invoice) { FactoryGirl.build(:invoice) }

    before { client.invoices << invoice }

    it "deletes the specified invoice for the client" do
      delete "/api/v1/clients/#{client.id}/invoices/#{invoice.id}.json", {}, auth

      expect(last_response.status).to eql(204)
    end
  end
end
