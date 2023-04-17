require 'tracks'

RSpec.describe TrackList do
  it "returns an empty array when no tracks are added" do
    track_list = TrackList.new
    result = track_list.display_tracks
    expect(result).to eq []
  end

  it "adds a track and displays a list" do
    track_list = TrackList.new
    track_list.add("Wonderwall")
    result = track_list.display_tracks
    expect(result).to eq ['Wonderwall']
  end

  it "adds multiple tracks and displays a list" do
    track_list = TrackList.new
    track_list.add("Wonderwall")
    track_list.add("Live Forever")
    result = track_list.display_tracks
    expect(result).to eq ['Wonderwall', 'Live Forever']
  end

end
