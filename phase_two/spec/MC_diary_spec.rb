require 'MC_diary'

RSpec.describe Diary do
  it "fails if no entry" do
    diary = Diary.new
    expect{diary.find_best_entry_for_reading_time(10,1)}.to raise_error "No entries added"
  end

  it "returns empty list if no entry added" do
    diary = Diary.new
    result = diary.return_contacts_list
    expect(result).to eq []
  end

end