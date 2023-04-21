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

  it "adds multiple dishes to the menu" do
    dish_1 = Dish.new("Thai Green Curry",8.99)
    dish_2 = Dish.new("Khao Soi",6.99)
    dish_3 = Dish.new("Pad Thai",7.99)
    menu = Menu.new
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    result = menu.display_menu 
    expect(result).to eq "1) Thai Green Curry      £8.99\n2) Khao Soi      £6.99\n3) Pad Thai      £7.99"
  end

  it "returns the correct instance of dish" do
    dish_1 = Dish.new("Thai Green Curry",8.99)
    dish_2 = Dish.new("Khao Soi",6.99)
    menu = Menu.new
    menu.add(dish_1)
    menu.add(dish_2)
    result = menu.menu_item(2)
    expect(result).to eq dish_2
  end

  it "returns an error if user picks an item number that doesn't exist" do
    dish_1 = Dish.new("Thai Green Curry",8.99)
    dish_2 = Dish.new("Khao Soi",6.99)
    menu = Menu.new
    menu.add(dish_1)
    menu.add(dish_2)
    expect{menu.menu_item(3)}.to raise_error "Menu Item 3 does not exist, please review the Menu and try again"
  end

  it "adds a menu item to an order and displays an itemised receipt" do
    dish_1 = Dish.new("Thai Green Curry",8.99)
    menu = Menu.new
    menu.add(dish_1)
    order = Order.new
    menu_item = menu.menu_item(1)
    order.add(menu_item)
    result = order.receipt 
    expect(result).to eq "Thai Green Curry   £8.99\ntotal: £8.99"
  end

  it "adds multiple menu items to an order and displays an itemised receipt" do
    dish_1 = Dish.new("Thai Green Curry",8.99)
    dish_2 = Dish.new("Khao Soi",6.99)
    dish_3 = Dish.new("Pad Thai",7.99)
    menu = Menu.new
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    order = Order.new
    menu_item = menu.menu_item(1)
    order.add(menu_item)
    menu_item = menu.menu_item(3)
    order.add(menu_item)
    result = order.receipt
    expect(result).to eq "Thai Green Curry   £8.99\nPad Thai   £7.99\ntotal: £16.98"
  end
  
  it "on completion it sends a confirmation text message" do
    dish_1 = Dish.new("Thai Green Curry",8.99)
    dish_2 = Dish.new("Khao Soi",6.99)
    dish_3 = Dish.new("Pad Thai",7.99)
    menu = Menu.new
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    order = Order.new
    menu_item = menu.menu_item(1)
    order.add(menu_item)
    menu_item = menu.menu_item(3)
    order.add(menu_item)
    fake_time = Time.new(2023, 04, 21, 18, 07, 00, "+00:00")
    result = order.complete(fake_time)
    expect(result).to eq "Thank you! Your order was placed and will be delivered before 18:52"
                 # sends a text message confirmation: 
                 # "Thank you! Your order was placed and will be delivered before 18:52"
  end
end