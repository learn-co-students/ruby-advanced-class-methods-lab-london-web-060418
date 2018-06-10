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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    newsong = create
    newsong.name = name
    newsong
  end

  def self.create_by_name(name)
    newsong = new_by_name(name)
    newsong.save
    newsong
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.uniq.sort_by {|item| item.name}
  end

  def self.new_from_filename(file_name)
    song_data = file_name.split("-")
    song_name = song_data[1].split(".")
    #Could also use find_or_create_by_name but it was not
    #specified that they want us to save it too
    #Would prefer to call find_or_create_by_name in here
    # and not use #create_from_filename at all

    song = self.new
    song.name = (song_name[0].strip)

    song.artist_name = song_data[0].strip
    song
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name).save
  end

  def self.destroy_all
    @@all.clear
  end


end
