class StringRepeater
  def initialize(terminal)
    @terminal = terminal
  end

  def run
    @terminal.puts "Hello. I will repeat a string many times."
    @terminal.puts "Please enter a string"
    input = @terminal.gets.chomp
    @terminal.puts "Please enter a number of repeats"
    no_of_repeats = @terminal.gets.chomp
    @terminal.puts "Here is your result:"
    result = input * no_of_repeats.to_i
    @terminal.puts result
  end
end



# string_repeater = StringRepeater.new(Kernel)
# string_repeater.run

# Hello. I will repeat a string many times.
# Please enter a string
# TWIX
# Please enter a number of repeats
# 10
# Here is your result:
# TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX