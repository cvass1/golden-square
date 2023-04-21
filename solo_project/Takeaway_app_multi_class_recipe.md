# Takeaway App - Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

_Diagram of the classes and their relationships using 
asciiflow.com:_

```
+-------------------+                +--------------------+                   +-------------------+
| Order             |                |  Menu              |                   | Dish(name,price)  |
|                   |                |                    |                   |                   |
| -add(menu_item)   +--------------->|  -add(dish)        +------------------>| -name             |
| -receipt          | owns a partial |  -display_menu     | owns a full list  | -price            |
| -complete         |  list of dish  |  -menu_item        | of dish instances |                   |
|                   |   instances    |                    |                   |                   |
+-------------------+(via menu_item) +--------------------+                   +-------------------+
```

_The interface of each class in more detail:_

```ruby
class Dish
  def initialize(name, price)
  end

  def name
    # returns the name of the dish
  end

  def price
    # returns the price of the dish
  end
end

class Menu
  def initialize
    # creates a menu list array where index will be used as an item_number
  end

  def add(dish) #dish is an instance of Dish
    # adds a dish to the menu list
    # returns nothing
  end

  def display_menu
    # returns the menu list of dishes with name and price
  end

  def menu_item(item_number)
    # returns the instance of Dish corresponding to the index(item_number) in the menu list
  end
end

class Order
  def initialize
    # creates an order list
  end

  def add(menu_item) #menu_item is the instance of Dish thats returned from Menu class menu_item method
    # adds a dish to the order list
    # returns nothing
  end

  def receipt
    # returns a string with contents of the order list and a grand total cost
  end

  def complete
    # returns a final receipt
    # sends a text confirming the order and providing a delivery time
  end
end
```

## 3. Create Examples as Integration Tests

_Examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used:_

```ruby
# adds a dish to the menu and displays the menu
dish_1 = Dish.new("Thai Green Curry",8.99)
menu = Menu.new
menu.add(dish_1)
menu.display_menu # => "1) Thai Green Curry      £8.99"

# adds multiple dishes to the menu and displays the menu
dish_1 = Dish.new("Thai Green Curry",8.99)
dish_2 = Dish.new("Khao Soi",6.99)
menu = Menu.new
menu.add(dish_1)
menu.add(dish_2)
menu.display_menu # => "1) Thai Green Curry      £8.99"
                  #    "2) Khao Soi"      £6.99"


# returns the correct instance of dish
dish_1 = Dish.new("Thai Green Curry",8.99)
dish_2 = Dish.new("Khao Soi",6.99)
menu = Menu.new
menu.add(dish_1)
menu.add(dish_2)
menu.menu_item(2) # => dish_2

# returns an error if user picks an item number that doesn't exist
dish_1 = Dish.new("Thai Green Curry",8.99)
dish_2 = Dish.new("Khao Soi",6.99)
menu = Menu.new
menu.add(dish_1)
menu.add(dish_2)
menu.menu_item(3) # => error message "Menu Item 3 does not exist, please review the Menu and try again"

# adds a menu item to an order
dish_1 = Dish.new("Thai Green Curry",8.99)
menu = Menu.new
menu.add(dish_1)
order = Order.new
menu_item = menu.menu_item(1)
order.add(menu_item)
order.receipt # => "Thai Green Curry   £8.99"
              #    total: £8.99"

# adds multiple menu items to an order
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
order.receipt  # => "Thai Green Curry   £8.99"
               # => "Pad Thai   £7.99"
               #    total: £16.98"


# on completion it sends a confirmation text message
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
order.complete # sends a text message confirmation: 
               # "Thank you! Your order was placed and will be delivered before 18:52"
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# constructs a dish
dish = Dish.new("Pad Thai",7.99)
dish.name # => "Pad Thai"
dish.price # => 7.99

# returns an error when no dishes are added
menu = Menu.new
menu.display_menu # => error message: "No dishes have been added to the menu"

# returns an error if asked to retrieve a menu item when no dishes have been added
menu = Menu.new
menu.menu_item(1) # => error message: "No dishes have been added to the menu"

# gives an empty receipt if no menu items have been added to an order
order = Order.new
order.receipt # => "total: £0.00"

# returns an error if no menu items have been added to an order on completion
order = Order.new
order.complete # => error message: "No items have been added to your order"

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._

