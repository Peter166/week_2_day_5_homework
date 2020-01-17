
class Guest

  attr_reader :name, :wallet, :fav_song
  attr_writer :wallet
  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end



  def fav_song_cheer(room)
    for song in room.songs
      # binding.pry
      if song.title == @fav_song
        return "Wohoo!"
      end
    end
  end


end
