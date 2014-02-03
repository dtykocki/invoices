require 'spec_helper'

describe "Invoice pages" do
  subject { page }

  let(:user)    { FactoryGirl.create(:user) }
  let(:client)  { FactoryGirl.create(:client, user: user) }

  before { sign_in user }

  describe "create" do
    before { visit new_invoice_path }

    context "with valid information" do
      it "creates an invoice" do
        expect { click_button "Save" }.to change(Invoice, :count).by(1)
      end
    end

  end
end
