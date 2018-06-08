require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "", artist_name = "")
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def self.all=(new_value)
    @@all = new_value
  end

  def self.create
    new_song = self.new
    new_song.save
    return new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    return new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song.save
    return new_song
  end

  def self.find_by_name(name)
    return self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ?  self.find_by_name(name) : self.create_by_name(name)
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
     return self.all.sort_by { |song| song.name.downcase }
  end

  def self.new_from_filename(filename)
    #"Thundercat - For Love I Come.mp3"
    filename_array = filename.split(/[-.]/)
    song_name = filename_array[1].strip
    song_artist = filename_array[0].strip
    return self.new(song_name, song_artist)
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    return new_song
  end

  def self.destroy_all
    self.all = []
  end

end
