require "check_codeword"

RSpec.describe "testing check_codeword method" do
  it "input 'horse' returns 'Correct! Come in.' " do
    result = check_codeword("horse")
    expect(result).to eq "Correct! Come in."
  end

  it "input 'hORSe' returns 'Close, but nope.' " do
    result = check_codeword("hORSe")
    expect(result).to eq "Close, but nope."
  end

  it "input 'horses' returns 'WRONG!' " do
    result = check_codeword("horses")
    expect(result).to eq "WRONG!"
  end

end