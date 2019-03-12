require_relative "concerns/findable.rb"
class Artist
  extend Concerns::Findable 
  attr_accessor :name, :songs
  @@all = [] 
  
  def initialize(name = nil)
    if name !=nil 
      @name = name 
      @songs = []
    end 
  end 
  
  def name=(name)
    @name = name 
  end 
  
  def self.all
    @@all
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def self.create(name)
    item = self.new(name)
    item.save 
    item 
  end 
  
  def add_song(song_name)
    if song_name.artist == nil 
      song_name.artist = self 
      @songs << song_name
    end 
  end 
  
  def genres
    genres = [] 
    Song.all.each do |song|
      if song.artist == self 
       genres << song.genre
       genres.uniq!
      end 
    end 
      genres 
  end 

  
end 