class GrammarStats
  def initialize
    @correct = 0
    @incorrect = 0
  end

  def check(text)
    result = text[0] == text[0].upcase && (text[-1] == "!" || text[-1] == ".")
    result == true ? @correct += 1 : @incorrect += 1
    return result
  end

  def percentage_good
    fail "no texts have been passed in" if ((@correct + @incorrect) == 0)
    (100*@correct.to_f/(@correct + @incorrect)).round(0)
  end
end