require "personal_diary"

RSpec.describe "make_snippet" do
  it "returns the first first words of a long sentence followed by ..." do
    result = make_snippet("The cat sat on the mat and ate a rat")
    expect(result).to eq "The cat sat on the..."
  end
  it "returns the first first words of a long sentence followed by ..." do
    result = make_snippet("The rat sat on the mat and ate a cat")
    expect(result).to eq "The rat sat on the..."
  end
  it "returns the first three words of a three word sentence without ..." do
    result = make_snippet("three blind mice")
    expect(result).to eq "three blind mice" 
  end
  it "returns an empty sentence without ..." do
    result = make_snippet("")
    expect(result).to eq "" 
  end
end