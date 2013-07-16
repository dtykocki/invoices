require 'spec_helper'

describe "Client pages" do
  subject { page }

  describe "index" do
    before do 
      FactoryGirl.create(:client, name: "Test Client", email: "example1@example.com")
      FactoryGirl.create(:client, name: "Another Client", email: "example2@example.com")

      visit "/clients" 
    end

    it "lists each client" do
      within_table('clients') do
        Client.all.each do |client|
          expect(page).to have_content client.name
          expect(page).to have_content client.email
        end
      end
    end
  end
end

