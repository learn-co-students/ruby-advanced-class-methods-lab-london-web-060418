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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end


  def self.create_by_name(title)
    song = Song.new
    song.name = title
    song.save
    song
  end

  def self.find_by_name(title)
    song = Song.new
    song.name = title
    self.all.find do |song|
      if song.name == title
        return song
      end
    end
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(artist_and_title)
    song = Song.new
    array = artist_and_title.split(" - ")
    # binding.pry
    song_title = array[1].chomp(".mp3")
    song.name = song_title
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(artist_and_title)
    song = Song.new
    array = artist_and_title.split(" - ")
    song_title = array[1].chomp(".mp3")
    song.name = song_title
    song.artist_name = array[0]
    song.save
    song
  end

  def self.destroy_all
    @@all = []
    #why just @@all works? why not self.all?
  end

end
