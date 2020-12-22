require 'pry'
class MP3Importer
  attr_reader :path
  def initialize(music_path)
    @path = music_path
  end

  def files
    Dir.entries(@path).select{ |i| i[/\.mp3$/] }
  end

  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end
end