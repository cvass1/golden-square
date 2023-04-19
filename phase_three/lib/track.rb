class Track
  def initialize(title, artist)
    fail "title should be a string" unless title.is_a? String
    fail "artist should be a string" unless artist.is_a? String
    @title = title
    @artist = artist
  end

  def matches?(keyword)
    @title.include?(keyword) || @artist.include?(keyword)
  end
end