class Artist
  attr_accessor :name
  # attr_reader :songs
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def songs
    Song.all.select {|song| song.artist && song.artist == self}
  end

  def add_song(song)
    song.artist = self
  end

  def print_songs
    songs.each {|song| puts song.name}
  end

  def self.find_or_create_by_name(name)
    artist = @@all.find {|artist| artist.name = name}
    artist = self.new(name) if !artist
    artist
  end

  def self.all 
    @@all
  end
end