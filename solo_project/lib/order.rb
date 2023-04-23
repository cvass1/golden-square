require "twilio-ruby"

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

  def complete(current_time = Time.now, requester = Twilio::REST::Client )
    # sends a text confirming the order and providing a delivery time
    fail "No items have been added to your order" if @order.length == 0
    
    delivery_minutes = 45 #hardcoded estimated time for delivery
    delivery_time = (current_time + delivery_minutes*60).strftime("%H:%M") 
    
    confirmation_message = "Thank you! Your order was placed and will be delivered before #{delivery_time}." # \nOrder Summary: \n" + receipt

    send_text(requester, confirmation_message)

  end

  private

  def send_text(requester, message)
    # Your Account SID and Auth Token from console.twilio.com
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    to_number = ENV["MY_PHONE_NUMBER"]
    from_number = ENV["TWILIO_PHONE_NUMBER"]

    client = requester.new(account_sid, auth_token)
    message = client.messages.create(
    body: message,
    to: to_number,
    from: from_number,
    )

  end
end