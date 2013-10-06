require 'spec_helper'

describe User do
  let(:user) { User.new(fake_attributes) }

  describe "attributes" do
    it { expect(user).to have_many :clients }
  end

  def fake_attributes
    { 
      email: "test@example.com", 
      first_name: "test",
      last_name: "tester"
    }
  end
end
