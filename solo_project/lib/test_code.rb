require_relative 'dish'
require_relative 'menu'
require_relative 'order'

dish_1 = Dish.new("Thai Green Curry",8.99)
dish_2 = Dish.new("Khao Soi",6.99)
dish_3 = Dish.new("Pad Thai",7.99)
dish_4 = Dish.new("Red Thai Curry",9.99)
dish_5 = Dish.new("Spring Rolls",4.99)

menu = Menu.new

menu.add(dish_1)
menu.add(dish_2)
menu.add(dish_3)
menu.add(dish_4)
menu.add(dish_5)

puts menu.display_menu + "\n "

order_1 = Order.new
item = menu.menu_item(2)
order_1.add(menu.menu_item(1))
order_1.add(menu.menu_item(5))
order_1.add(menu.menu_item(2))
puts order_1.receipt + "\n "

order_2 = Order.new

menu_2 = Menu.new
menu_2.add(dish_5)
puts menu_2.display_menu





