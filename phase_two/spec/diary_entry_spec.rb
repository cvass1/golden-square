require 'diary_entry'

RSpec.describe DiaryEntry do  
  it "returns title" do
    diary_entry_1 = DiaryEntry.new("1st entry","hello world")
    result = diary_entry_1.title
    expect(result).to eq "1st entry"
  end
  it "returns contents" do
    diary_entry_1 = DiaryEntry.new("1st entry","hello world")
    result = diary_entry_1.contents
    expect(result).to eq "hello world"
  end
  
  it "counts the words in the contents" do
    diary_entry_1 = DiaryEntry.new("1st entry","hello world")
    result = diary_entry_1.count_words
    expect(result).to eq 2
  end

    # wpm is an integer representing the number of words the
    # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.

  context "calculates reading time in minutes based on reading speed (rounded up to nearest 1):" do
    it "eg returns 2 when WPM is 1 and word count is 2" do
      diary_entry_1 = DiaryEntry.new("1st entry","hello world")
      result = diary_entry_1.reading_time(1)
      expect(result).to eq 2
    end

    it "eg returns 1 when WPM is 200 and word count is 2" do
      diary_entry_1 = DiaryEntry.new("1st entry","hello world")
      result = diary_entry_1.reading_time(200)
      expect(result).to eq 1
    end

    it "eg returns 3 when WPM is 100 and word count is 250" do
      diary_entry_1 = DiaryEntry.new("1st entry","hello "*250)
      result = diary_entry_1.reading_time(100)
      expect(result).to eq 3
    end

    it "eg it returns an error when WPM is 0 or less" do
      diary_entry_1 = DiaryEntry.new("1st entry","hello world")
      expect{diary_entry_1.reading_time(0)}.to raise_error "WPM must be above zero"
  
    end

  end

    # `wpm` is an integer representing the number
    # of words the user can read per minute
    # `minutes` is an integer representing the
    # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  


  context "returns text for a given WPM and time" do
    it "eg returns full text when WPM is 100, minutes is 1 and word count is 2 " do
      diary_entry_1 = DiaryEntry.new("1st entry","hello world")
      result = diary_entry_1.reading_chunk(100,1)
      expect(result).to eq "hello world"
    end

    it "eg returns partial text when WPM is 1, minutes is 2 and word count is 4 " do
      diary_entry_1 = DiaryEntry.new("1st entry","hello again beautiful world")
      result = diary_entry_1.reading_chunk(1,2)
      expect(result).to eq "hello again"
    end

    it "eg returns next partial text when a chunk has already been read " do
      diary_entry_1 = DiaryEntry.new("1st entry","hello again beautiful world")
      diary_entry_1.reading_chunk(1,2)
      result = diary_entry_1.reading_chunk(1,2)
      expect(result).to eq "beautiful world"
    end

    it "eg returns back to the begginging after all chunks have been read" do
      diary_entry_1 = DiaryEntry.new("1st entry","hello again beautiful world")
      diary_entry_1.reading_chunk(3,1)
      diary_entry_1.reading_chunk(3,1)
      result = diary_entry_1.reading_chunk(3,1)
      expect(result).to eq "hello again beautiful"
    end

    it "eg it returns an error when WPM is 0 or less" do
      diary_entry_1 = DiaryEntry.new("1st entry","hello world")
      expect{diary_entry_1.reading_chunk(0, 1)}.to raise_error "WPM must be above zero"
    end
    

  end

end