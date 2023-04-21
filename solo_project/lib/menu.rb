class Menu
  def initialize
    # creates a menu list array where index will be used as an item_number
    @menu =[]
  end

  def add(dish) #dish is an instance of Dish
    # adds a dish to the menu list
    # returns nothing
    @menu.push(dish)
  end

  def display_menu
    # returns the menu list of dishes with name and price
    fail "No dishes have been added to the menu" if @menu.length == 0

    @menu.each_with_index.map{|item, index| 
      "#{index+1}) #{item.name}      £#{item.price}"
      }.join("\n")
  end

  def menu_item(item_number)
    #returns the instance of Dish corresponding to the index(item_number) in the menu list
    fail "No dishes have been added to the menu" if @menu.length == 0

  end
end