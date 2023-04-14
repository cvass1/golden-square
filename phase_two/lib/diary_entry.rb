class DiaryEntry
  def initialize(title, contents) 
    @title = title
    @contents = contents
    @last_word_read = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split(" ").size
  end

  def reading_time(wpm) 
    (count_words.to_f/wpm).ceil.round(0) 
  end

  def reading_chunk(wpm, minutes) 
    words_to_read = wpm * minutes
    reading_chunk = @contents.split(" ").slice(@last_word_read,@last_word_read+words_to_read).join(" ")
    @last_word_read += words_to_read
    if @last_word_read >= count_words
      @last_word_read = 0
    end
    return reading_chunk
  end
end