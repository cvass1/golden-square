require 'music_library'

describe MusicLibrary do
  context "for method #all" do
    it "returns an empty list when no tracks added" do
      music_library = MusicLibrary.new
      expect(music_library.all).to eq []
    end 

    it "returns a list of tracks" do
      music_library = MusicLibrary.new
      track_1 = double :fake_track
      track_2 = double :fake_track
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.all).to eq [track_1, track_2]
    end
  end

  context "for method #search" do
    it "returns an empty list" do
      music_library = MusicLibrary.new
      result = music_library.search("Forever")
      expect(result).to eq []
    end

    it "returns a list of tracks that match a search" do
      music_library = MusicLibrary.new
      track_1 = double(:fake_track, matches?: true )
      music_library.add(track_1)
      result = music_library.search("cats")
      expect(result).to eq [track_1]
    end

    it "returns an empty list when no matches" do
      music_library = MusicLibrary.new
      track_1 = double(:fake_track, matches?: false )
      track_2 = double(:fake_track, matches?: false )
      music_library.add(track_1)
      music_library.add(track_2)
      result = music_library.search("cats")
      expect(result).to eq []
    end
  end
end