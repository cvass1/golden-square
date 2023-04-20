require 'diary'

RSpec.describe Diary do
  it 'constructs and returns contents' do
    diary = Diary.new("my contents")
    expect(diary.read).to eq "my contents"
  end
end