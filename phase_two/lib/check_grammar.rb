def check_grammar(text)
  fail if text == ""
  text[0] == text[0].upcase && (text[-1] == "!" || text[-1] == ".")
end