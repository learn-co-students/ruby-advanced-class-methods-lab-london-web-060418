require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song = self.create_by_name(name) if !song
    song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    parsed_filename = filename.split(' - ')
    artist = parsed_filename[0]
    song_name = parsed_filename[1].split('.')[0]
    new_song = self.new_by_name(song_name)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    parsed_filename = filename.split(' - ')
    artist = parsed_filename[0]
    song_name = parsed_filename[1].split('.')[0]
    new_song = self.create_by_name(song_name)
    new_song.artist_name = artist
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
