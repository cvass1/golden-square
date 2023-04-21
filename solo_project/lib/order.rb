class Order
  def initialize
    # creates an order list
    @order = []
  end

  def add(menu_item) #menu_item is the instance of Dish thats returned from Menu class menu_item method
    # adds a dish to the order list
    # returns nothing
    @order.push(menu_item)
  end

  def receipt
    # returns a string with contents of the order list and a grand total cost
    total = @order.map{|item| item.price}.sum

    receipt = @order.map{|item|
      "#{item.name}   £#{item.price}"}.join("\n")
    receipt += "\ntotal: £#{'%.2f' % total}"
  end

  def complete(current_time = Time.now)
    # sends a text confirming the order and providing a delivery time
    fail "No items have been added to your order" if @order.length == 0
    
    delivery_minutes = 45 #hardcoded estimated time for delivery
    delivery_time = (current_time + delivery_minutes*60).strftime("%H:%M") # extimate delivery time to be current hour/mins plus time taken for delivery
    
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"

  end
end