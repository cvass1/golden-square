require 'secret_diary'

RSpec.describe SecretDiary do
  it 'returns GO AWAY if read (diary starts off as locked)' do
    diary = double(:fake_diary)
    secret_diary = SecretDiary.new(diary)
    expect{secret_diary.read}.to raise_error "Go away!"  
  end

  it 'returns diary contents if unlocked' do
    diary = double(:fake_diary, read: "Fake contents")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "Fake contents"
  end

  it 'returns GO AWAY if unlocked and locked again' do
    diary = double(:fake_diary)
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect {secret_diary.read}.to raise_error "Go away!"  
  end

end