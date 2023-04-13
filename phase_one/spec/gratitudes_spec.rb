require 'gratitudes'

RSpec.describe "testing gratitudes class" do
  it "adds a gratitude 'friends' and then prints 'Be grateful for: friends'" do
    mygratitudes = Gratitudes.new
    mygratitudes.add('friends')
    result = mygratitudes.format
    expect(result).to eq "Be grateful for: friends"
  end

  it "adds a gratitude 'friends' and 'family' and then prints 'Be grateful for: friends, family'" do
    mygratitudes = Gratitudes.new
    mygratitudes.add('friends')
    mygratitudes.add('family')
    result = mygratitudes.format
    expect(result).to eq "Be grateful for: friends, family"
  end
end