require 'MC_diary'
require 'MC_diary_entry'

RSpec.describe Diary do
  it "adds one entry and returns list" do
    diary = Diary.new
    entry1 = DiaryEntry.new("my_title","my_contents")
    diary.add(entry1)
    result = diary.return_diary_entry_contents(entry1)
    expect(result).to eq "my_contents"
  end

  it 'returns the best entry' do
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

  it "returns list of numbers from diaryentry contents " do
    diary = Diary.new
    entry1 = DiaryEntry.new("my_title", "hi there, 07495987743")
    diary.add(entry1)
    result = diary.return_contacts_list
    expect(result).to eq ["07495987743"]
  end
end