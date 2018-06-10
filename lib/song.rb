class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all    #Song.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create   #creates and saves
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name }
    #detects a song and then compares it to a name   true/false
  end

  def self.find_or_create_by_name(name)
    #if it exists, return it|| or create it
    self.find_by_name(name) || self.create_by_name(name)
  end

# ????
  def self.alphabetical
    #@@all.uniq - to ensure there are no duplicates
    @@all.uniq.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    #"Taylor Swift - Blank Space.mp3"
    track_array = filename.split(/\-|\./)
    song_name = track_array[1].strip  #Blank Space
    artist_s = track_array[0].strip  #Taylor Swift 

    song = self.create   #this is a new song
    song.name = song_name
    song.artist_name = artist_s
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save   #saves the song
  end

  def self.destroy_all
    self.all.clear
  end

end
