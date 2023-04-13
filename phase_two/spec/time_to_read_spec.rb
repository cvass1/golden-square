require 'time_to_read'

RSpec.describe "time_to_read" do
  it "returns 0.0 for an empty text" do
    result = time_to_read("")
    expect(result).to eq "0.0 minutes"
  end  

  it "returns '1.0 minute' for a 200 word text" do
    result = time_to_read("hello "*200)
    expect(result).to eq "1.0 minute"
  end 

  it "returns '0.0 minutes' for a 2 word text" do
    result = time_to_read("hello "*2)
    expect(result).to eq "0.0 minutes"
  end 
  
  it "returns '0.1 minutes' for a 20 word text" do
    result = time_to_read("hello "*20)
    expect(result).to eq "0.1 minutes"
  end 

  it "returns '0.5 minutes' for a 100 word text" do
    result = time_to_read("hello "*100)
    expect(result).to eq "0.5 minutes"
  end 

  it "returns '2.1 minutes' for a 415 word text" do
    result = time_to_read("hello "*415)
    expect(result).to eq "2.1 minutes"
  end 

end