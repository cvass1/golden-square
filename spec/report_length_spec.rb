require 'report_length'

RSpec.describe "testing report_length method" do
  it "returns 16 on input 'this is a string'" do
    result = report_length('this is a string')
    expect(result).to eq "This string was 16 characters long."
  end

  it "returns 41 on input 'this is also a string with nu3mbers in it'" do
    result = report_length('this is also a string with nu3mbers in it')
    expect(result).to eq "This string was 41 characters long."
  end

  it "returns 1 on input '6'" do
    result = report_length('6')
    expect(result).to eq "This string was 1 characters long."
  end

end