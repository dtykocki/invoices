u = User.where(email: "tykockda@gmail.com").first

(1..100).each do |i|
  c = Client.new(name: "Client #{i}", email: "testclient@example.com", company_name: "Company #{i}")
  u.clients << c
end
