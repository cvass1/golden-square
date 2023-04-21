require 'dish'
require 'menu'
require 'order'

RSpec.describe 'takeaway integration' do
  it "adds a dish to the menu" do
    dish_1 = Dish.new("Thai Green Curry",8.99)
    menu = Menu.new
    menu.add(dish_1)
    result = menu.display_menu 
    expect(result).to eq "1) Thai Green Curry      £8.99"
  end
end