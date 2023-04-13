require 'greet'

RSpec.describe "testing greet method" do
  it "returns 'Hello, Mary' when given 'Mary'" do
    expect(greet("Mary")).to eq "Hello, Mary"
  end
end