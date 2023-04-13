require 'present'

RSpec.describe "present" do
  context "it gives error message" do
    it "added to contents twice" do
      mums_present = Present.new
      mums_present.wrap("candle")
      expect { mums_present.wrap("soap") }.to raise_error "A contents has already been wrapped."
    end
  end
end