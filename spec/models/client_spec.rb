require 'spec_helper'

describe Client do
  let(:client) { Client.new(fake_attributes) }

  describe "attributes" do
    it { expect(client).to validate_presence_of :name   }
    it { expect(client).to validate_presence_of :email  }
    it { expect(client).to_not validate_presence_of :company_name }
    it { expect(client).to_not validate_presence_of :address_line_1 }
    it { expect(client).to_not validate_presence_of :address_line_2 }
    it { expect(client).to_not validate_presence_of :city }
    it { expect(client).to_not validate_presence_of :state }
    it { expect(client).to_not validate_presence_of :zip_code }
  end

  private

  def fake_attributes
    { name: "Person A", email: "example@example.com" }
  end
end
