require 'vowel_remover'

RSpec.describe "remove_vowels method" do
  
  it "removes all letters from string 'aeiou' and returns an empty string" do
    remover = VowelRemover.new("aeiou")
    result_no_vowels = remover.remove_vowels
    expect(result_no_vowels).to eq ""
  end

  it "removes all vowels from string 'aaeebeeeiiibiiobuuuubuuu' and returns an empty string" do
    remover = VowelRemover.new("aaeebeeeiiibiiobuuuubuuu")
    result_no_vowels = remover.remove_vowels
    expect(result_no_vowels).to eq "bbbb"
  end
  
  it "removes a vowel from a simple string" do
    remover = VowelRemover.new("ab")
    result_no_vowels = remover.remove_vowels
    expect(result_no_vowels).to eq "b"
  end

  it "removes vowels from a complex string" do
    remover = VowelRemover.new("We will remove the vowels from this sentence.")
    result_no_vowels = remover.remove_vowels
    expect(result_no_vowels).to eq "W wll rmv th vwls frm ths sntnc."
  end
end