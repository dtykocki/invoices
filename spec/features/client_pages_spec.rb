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

    it "links to the client creation page" do
      expect(page).to have_link "New Client", href: "/clients/new"
    end

    it "links to the client edit page" do
      within_table('clients') do
        Client.all.each do |client|
          expect(page).to have_link "Edit", href: "/clients/#{client.id}/edit"
        end
      end
    end

    it "links to the client destroy action" do
      within_table('clients') do
        Client.all.each do |client|
          expect(page).to have_link "Delete", href: "/clients/#{client.id}"
        end
      end
    end
  end

  describe "create" do
    before { visit new_client_path }

    context "with invalid information" do
      it "does not create a client" do
        expect { click_button "Create" }.not_to change(Client, :count)
      end
    end

    context "with valid information" do
      it "creates a new client" do
        fill_in "Name",   with: "Example Client"
        fill_in "Email",  with: "example_client@example.com"

        expect { click_button "Create" }.to change(Client, :count).by(1)
      end
    end
  end

end

