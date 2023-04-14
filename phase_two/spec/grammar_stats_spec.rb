require 'grammar_stats'

RSpec.describe GrammarStats do
  
  context "checks if text begins with capital letter and ends with punctuation mark: " do
    it "eg returns true for 'Hello, world.'" do
      grammar_stats = GrammarStats.new
      result = grammar_stats.check("Hello, world.")
      expect(result).to eq true
    end

    it "eg returns false for 'hello, world.'" do
      grammar_stats = GrammarStats.new
      result = grammar_stats.check("hello, world.")
      expect(result).to eq false
    end

    it "eg returns false for 'Hello, world'" do
      grammar_stats = GrammarStats.new
      result = grammar_stats.check("Hello, world")
      expect(result).to eq false
    end

  end

  context "calculated correct percentage of good texts: " do
    it "eg returns 100 when passed one correct text" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("Hello, world.")
      result = grammar_stats.percentage_good
      expect(result).to eq 100
    end

    it "eg returns 50 when passed one correct text and one incorrect text" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("Hello, world.")
      grammar_stats.check("Hello, world")
      result = grammar_stats.percentage_good
      expect(result).to eq 50
    end

    it "eg returns 25 when passed one correct text and three incorrect text" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("Hello, world.")
      grammar_stats.check("Hello, world")
      grammar_stats.check("hello, world")
      grammar_stats.check("hello, world!")
      result = grammar_stats.percentage_good
      expect(result).to eq 25
    end

    it "eg returns an error if no texts have been passed" do
      grammar_stats = GrammarStats.new
      expect{ grammar_stats.percentage_good }.to raise_error "no texts have been passed in"
    end
  end


end