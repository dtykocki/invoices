require 'spec_helper'

describe Invoice do
  describe "attributes" do
    it { should validate_presence_of(:due_date) }
  end
end
