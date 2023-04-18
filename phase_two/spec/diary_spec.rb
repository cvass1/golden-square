require 'diary'

RSpec.describe Diary do
  context 'when no entries are added' do
    it 'returns an empty list' do
      diary = Diary.new
      expect(diary.all).to eq []
    end
    it 'returns 0 for #count_words' do
      diary = Diary.new
      expect(diary.count_words).to eq 0
    end

    it 'returns 0 for #reading_time' do
      diary = Diary.new
      expect(diary.reading_time(10)).to eq 0
    end

    it 'returns an error for #find_best_entry_for_reading_time' do
      diary = Diary.new
      expect{diary.find_best_entry_for_reading_time(10,1)}.to raise_error "No entries added"
    end
  end
end