require 'string_repeater'

RSpec.describe StringRepeater do
  it 'takes a string from the user and puts a repeated string' do
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(terminal).to receive(:puts).with("Please enter a string").ordered
    expect(terminal).to receive(:gets).and_return("oh hey! ")
    expect(terminal).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(terminal).to receive(:gets).and_return("3")
    expect(terminal).to receive(:puts).with("Here is your result:").ordered
    expect(terminal).to receive(:puts).with("oh hey! oh hey! oh hey! ").ordered


    string_repeater = StringRepeater.new(terminal)
    string_repeater.run

  end

end