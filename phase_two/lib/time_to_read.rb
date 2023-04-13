def time_to_read(text)
  time_taken = (text.split(" ").length.to_f/200).round(1)
  return time_taken == 1? "#{time_taken} minute" : "#{time_taken} minutes"
end

