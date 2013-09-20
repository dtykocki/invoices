require 'spec_helper'

describe Client do
  let(:client) { Client.new(fake_attributes) }

  describe "attributes" do
    it { expect(client).to validate_presence_of :name   }
    it { expect(client).to validate_presence_of :email  }
  end

  private

  def fake_attributes
    { name: "Person A", email: "example@example.com" }
  end
end
