require 'spec_helper'

describe "Clients API", type: :api do
  describe "client listing" do
    it "should return all clients" do
      FactoryGirl.create_list(:client, 10)

      get '/api/v1/clients', format: :json

      expect(last_response.status).to eql 200
    end
  end
end
