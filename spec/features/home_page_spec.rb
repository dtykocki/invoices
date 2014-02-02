require 'spec_helper'

describe "Home page" do
  before { visit root_path }

  it "render successfully" do
    expect(page.status_code).to be(200)
  end

  it "displays the page title" do
    expect(page).to have_title 'Invoices'
  end

  describe "Main navigation" do
    it "displays the application name" do
      expect(page).to have_selector '.navbar .navbar-brand', text: 'Invoices'
    end

    it "links to a client listing" do
      expect(page).to have_link 'Clients', href: '/clients'
    end
  end
end
