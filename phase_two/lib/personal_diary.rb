def make_snippet(sentence)
  first_five_words_ellipsis = sentence.split(" ").take(5).join(" ") + "..."
  sentence.split(" ").size <= 5 ? sentence : first_five_words_ellipsis
end
