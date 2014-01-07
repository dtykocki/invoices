c = Client.new(name: "Test Client", email: "testclient@example.com", company_name: "Test Company")

u = User.where(email: "tykockda@gmail.com").first
u.clients << c

invoices = []
(1..20).each do |i|
  invoice = Invoice.new(unique_id: i, due_date: Date.today, amount: 2.00, status: "Draft")
  invoices << invoice
end

c.invoices << invoices
