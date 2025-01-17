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
    song = self.new 
    song.name = name 
    song
  end 
  
  def self.create_by_name(name) 
    song = self.new 
    song.name = name 
    song.save  
    song 
  end 
  
  def self.find_by_name(name) 
    self.all.find { |song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name) 
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name)
    end 
  end 
  
  def self.alphabetical 
    self.all.sort { |x, y| x.name <=> y.name }
  end 
  
  def self.new_from_filename(filename)
    filename_sans_mp3 = filename[0..-5]
    filename_array = filename_sans_mp3.split("-")
    song = self.new 
    song.name = filename_array[1].strip
    song.artist_name = filename_array[0].strip 
    song 
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save 
  end 
  
  def self.destroy_all 
    self.all.clear
  end 
  
  
  
  
  
  
  
  
  
  
  
  
  
  

end
 