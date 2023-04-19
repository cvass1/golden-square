require 'track'

describe Track do
  context 'for #matches? method' do
    it 'returns true if keyword matches either artist or title' do
      track = Track.new("live forever","oasis")
      result = track.matches?('forever')
      expect(result).to eq true
    end

    it 'returns false if keyword matches neither artist or title' do
      track = Track.new("live forever","oasis")
      result = track.matches?('cats')
      expect(result).to eq false
    end

  end

  context 'fails if artist or title are not a string' do
    it 'fails on artist' do
      expect {Track.new("live forever", 1)}.to raise_error "artist should be a string"
    end

    it 'fails on title' do
      expect {Track.new(1, "Oasis")}.to raise_error "title should be a string"
    end
  end
end