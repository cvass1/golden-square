class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track)
    @tracks << track
  end

  def all
    @tracks
  end
  
  def search(keyword)
    @tracks.filter do |track|
      track.matches?(keyword)
    end
  end
end