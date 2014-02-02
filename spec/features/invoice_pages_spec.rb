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
        expect { click_button "Create" }.to change(Invoice, :count).by(1)
      end
    end

  end
end

#describe "Invoice pages" do
  #context "index" do
    #subject { page }

    #before { 10.times { FactoryGirl.create(:invoice) } }

    #it "lists each invoice" do
      #visit root_path

      #within_table('invoices') do
        #Invoice.all.each do |invoice|
          #expect(page).to have_content invoice.unique_id
          #expect(page).to have_content invoice.due_date.strftime("%d %b %Y")
          #expect(page).to have_content invoice.amount
          #expect(page).to have_content invoice.status
        #end
      #end
    #end
  #end
#end

