class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    # no return value
    @entries.push(entry)
  end

  def all
    @entries
  end

  def count_words
    @entries.map{ |entry| entry.count_words }.sum
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    @entries.map{ |entry| entry.reading_time(wpm) }.sum
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
    fail "No entries added" if @entries == [] 
    entry_word_counts = {}
    max_words = wpm * minutes

    @entries.each{ |entry| entry_word_counts[entry] = entry.count_words }

    result_pair = entry_word_counts.select{|k,v| v < max_words}.max_by{|k,v| v }

    return result_pair == nil ? nil : result_pair[0]


  end
end