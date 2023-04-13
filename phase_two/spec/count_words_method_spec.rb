require 'count_words_method'

RSpec.describe "count_words" do
  context "given an empty string" do
    it "returns 0" do
      result = count_words("")
      expect(result).to eq 0
    end
  end

  context "given a string with 3 words" do
    it "returns 3" do
      result = count_words("the cat sat")
      expect(result).to eq 3
    end
  end

  context "given a string with 1 character" do
    it "returns 1" do
      result = count_words("t")
      expect(result).to eq 1
    end
  end

end