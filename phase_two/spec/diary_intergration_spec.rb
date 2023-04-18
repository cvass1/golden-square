require 'diary'
require 'diary_entry'

RSpec.describe 'diary intergration' do
  context 'adds entries to diary' do
    it "returns a list of one added entry" do
      diary = Diary.new
      entry1 = DiaryEntry.new("my_title","my_contents")
      diary.add(entry1)
      result = diary.all
      expect(result).to eq [entry1]
    end
  
  end

  context "returns correct word count" do

    it 'returns the word count of one entry' do
      diary = Diary.new
      entry1 = DiaryEntry.new("my_title", "my_contents")
      diary.add(entry1)
      result = diary.count_words
      expect(result).to eq 1
    end

    it 'returns total word count for multiple entries' do
      diary = Diary.new
      entry1 = DiaryEntry.new("my_title", "my_contents")
      entry2 = DiaryEntry.new("my_title", "my contents")
      diary.add(entry1)
      diary.add(entry2)
      result = diary.count_words
      expect(result).to eq 3
    end
  end

  context 'it returns the correct reading time' do
    it 'returns 0 on no entries' do
      diary = Diary.new
      expect(diary.reading_time(100)).to eq 0
    end

    it 'returns correct time for one entry' do
      diary = Diary.new
      entry = DiaryEntry.new("my_title", "hi there")
      diary.add(entry)
      result = diary.reading_time(1)
      expect(result).to eq 2
    end

    it 'returns correct time when added two entries' do
      diary = Diary.new
      entry1 = DiaryEntry.new("my_title", "hi there")
      entry2 = DiaryEntry.new("my_title", "my contents are here!")
      diary.add(entry1)
      diary.add(entry2)
      result = diary.reading_time(2)
      expect(result).to eq 3
    end
  end

  describe '#find_best_entry_for_reading_time' do
    
    context "when one entry is added" do
      it "returns the only entry when the entry is shorter than total reading time" do
        diary = Diary.new
        entry1 = DiaryEntry.new("my_title", "hi there")
        diary.add(entry1)
        result = diary.find_best_entry_for_reading_time(10,1)
        expect(result).to eq entry1
      end

      it "returns nil when the entry is longer than total reading time" do
        diary = Diary.new
        entry1 = DiaryEntry.new("my_title", "hi there")
        diary.add(entry1)
        result = diary.find_best_entry_for_reading_time(1,1)
        expect(result).to eq nil
      end
    end

    context "picks closest entry when multiple are added" do
      it "returns the right result when all results are readable" do
        diary = Diary.new
        entry1 = DiaryEntry.new("my_title", "hi there")
        entry2 = DiaryEntry.new("my_title", "hi there you")
        entry3 = DiaryEntry.new("my_title", "hi there you and pal")
        diary.add(entry1)
        diary.add(entry2)
        diary.add(entry3)
        result = diary.find_best_entry_for_reading_time(10,1)
        expect(result).to eq entry3
      end

      it "returns the right result when only some results are readable" do
        diary = Diary.new
        entry1 = DiaryEntry.new("my_title", "hi there")
        entry2 = DiaryEntry.new("my_title", "hi there you")
        entry3 = DiaryEntry.new("my_title", "hi there you and pal how are you today")
        diary.add(entry1)
        diary.add(entry2)
        diary.add(entry3)
        result = diary.find_best_entry_for_reading_time(5,1)
        expect(result).to eq entry2
      end
    end

  end


end