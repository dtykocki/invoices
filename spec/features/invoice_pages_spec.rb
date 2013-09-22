require 'spec_helper'

describe "Invoice pages" do
  context "index" do
    subject { page }

    before { 10.times { FactoryGirl.create(:invoice) } }

    it "lists each invoice" do
      visit root_path

      within_table('invoices') do
        Invoice.all.each do |invoice|
          expect(page).to have_content invoice.unique_id
          expect(page).to have_content invoice.due_date.strftime("%d %b %Y")
          expect(page).to have_content invoice.amount
          expect(page).to have_content invoice.status
        end
      end
    end
  end
end

