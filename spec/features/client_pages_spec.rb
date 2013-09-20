require 'spec_helper'

describe "Client pages" do
  subject { page }

  describe "index" do
    before do 
      FactoryGirl.create(:client, name: "Client 1", email: "example1@example.com")
      FactoryGirl.create(:client, name: "Client 2", email: "example2@example.com")

      visit clients_path 
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

  describe "edit" do
    let(:client) { FactoryGirl.create(:client) }
    
    before { visit edit_client_path(client) }

    context "with valid information" do
      it "edits the client record" do
        fill_in "Name",   with: "Client Two"
        fill_in "Email",  with: "clienttwo@example.com"
        click_button "Update"

        expect(client.reload.name).to eq "Client Two"
        expect(client.reload.email).to eq "clienttwo@example.com"
      end
    end

    context "with invalid information" do
      it "does not edit the client record" do
        fill_in "Name",   with: ""
        fill_in "Email",  with: ""
        click_button "Update"

        expect(page).to have_content('errors')
      end
    end
  end

  describe "destroy" do
    before do
      FactoryGirl.create(:client)
      visit clients_path 
    end

    it "deletes a client" do
      expect { click_link 'Delete', match: :first }.to change(Client, :count).by(-1)
    end
  end

end

