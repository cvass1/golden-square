require 'secret_diary'
require 'diary'

RSpec.describe 'diary integration' do
  it 'returns GO AWAY if read (diary starts off as locked)' do
    diary = Diary.new("my contents")
    secret_diary = SecretDiary.new(diary)
    expect {secret_diary.read}.to raise_error "Go away!"  
  end

  it 'returns diary contents if unlocked' do
    diary = Diary.new("my contents")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "my contents"
  end

  it 'returns GO AWAY if unlocked and locked again' do
    diary = Diary.new("my contents")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect {secret_diary.read}.to raise_error "Go away!"  
  end
end