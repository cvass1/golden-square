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
end