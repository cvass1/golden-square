require 'music_library'
require 'track'

describe MusicLibrary do
  context "for method #all" do
    it "returns an empty list when no tracks added" do
      music_library = MusicLibrary.new
      expect(music_library.all).to eq []
    end 

    it "returns a list of tracks" do
      music_library = MusicLibrary.new
      track1 = Track.new("Oasis", "Live Forever")
      music_library.add(track1)
      expect(music_library.all).to eq [track1] 

      track2 = Track.new("Foo Fighter", "The Pretender")
      music_library.add(track2)
      expect(music_library.all).to eq [track1, track2]
    end
  end

  context "for method #search" do
    it "returns a list of tracks that match a search" do
      music_library = MusicLibrary.new
      track1 = Track.new("Oasis", "Live Forever")
      track2 = Track.new("Foo Fighter", "The Pretender")
      music_library.add(track1)
      music_library.add(track2)
      result = music_library.search("Forever")
      expect(result).to eq [track1]
    end
  end
end