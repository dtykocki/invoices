namespace :db do
  desc "Populate database with sample data"
  task populate: :environment do
    create_invoices
  end
end

def create_invoices
  100.times do |i|
    Invoice.create(
      unique_id: i,
      due_date: DateTime.now,
      amount: i / 1.0,
      status: "Draft"
    )
  end
end
