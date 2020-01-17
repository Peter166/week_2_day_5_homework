class Room

  attr_reader :number, :guests, :songs, :drinks
  attr_writer :guests
  def initialize(number, songs, guests, drinks)
    @number = number
    @songs = songs
    @guests= guests
    @drinks = drinks


  end


  def check_in(quest)
    return "room in full." unless @guests.count() <= 2
     @guests.push(quest)
  end

  def check_out(guest)
      @guests.delete(guest)
  end

  def add_song(song)
    @songs.push(song)
  end



end
