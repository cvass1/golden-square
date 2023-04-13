require 'check_grammar'

RSpec.describe "check_grammar" do
  context "it returns an error on an empty string" do
    it "fails" do
      expect{check_grammar("")}.to raise_error
    end  
  end 
  
  context "returns true for a valid string" do
    it "returns true" do
      expect(check_grammar("Hello, world!")).to eq true
    end  
    it "returns true" do
      expect(check_grammar("Hello, world.")).to eq true
    end  
  end  

  context "returns false for an invalid string" do
    it "returns false if no punctuation at the end" do
      expect(check_grammar("Hello, world")).to eq false
    end

    it "returns false if not capitalised" do
      expect(check_grammar("hello, world!")).to eq false
    end

    it "returns false if not capitalised and no punctuation at the end" do
      expect(check_grammar("hello, world")).to eq false
    end

  end  

end