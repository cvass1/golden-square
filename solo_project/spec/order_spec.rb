require 'order'

RSpec.describe Order do
  context "when no menu items have been added to an order: " do
    it "returns an empty receipt" do
      order = Order.new
      expect(order.receipt).to eq "total: £0.00"
    end

    it "returns an error when #complete is called" do
      order = Order.new
      expect{order.complete}.to raise_error "No items have been added to your order"
    end
  end
end