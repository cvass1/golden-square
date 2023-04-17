class TrackList
  def initialize
    @list = []
  end

  def add(track)
    @list.push(track)
  end

  def display_tracks
    @list
  end
end