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
    new_song = self.new.save
    new_song
  end

end
