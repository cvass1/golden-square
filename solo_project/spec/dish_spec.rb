require 'dish'

RSpec.describe Dish do
  context "it constructs a dish, " do
    it "returns the dish name" do
      dish = Dish.new("Pad Thai",7.99)
      expect(dish.name).to eq "Pad Thai"
    end

    it "returns the dish price" do
      dish = Dish.new("Pad Thai",7.99)
      expect(dish.price).to eq 7.99
    end
  end
end