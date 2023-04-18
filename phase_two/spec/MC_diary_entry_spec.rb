require 'MC_diary_entry'

RSpec.describe DiaryEntry do
  it "counts the words in contents" do
    diary_entry = DiaryEntry.new('my_title', 'my_contents')
    result = diary_entry.count_words
    expect(result).to eq 1
  end

  it "returns the title as a string" do
    diary_entry = DiaryEntry.new('my_title', 'my_contents')
    result = diary_entry.title
    expect(result).to eq 'my_title'
  end

  it "returns the contents as a string" do
    diary_entry = DiaryEntry.new('my_title', 'my_contents')
    result = diary_entry.contents
    expect(result).to eq 'my_contents'
  end
end