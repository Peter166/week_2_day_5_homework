
class CaraokeBar
  attr_reader :name, :rooms, :til,:drinks, :bartab
  attr_writer :name, :til, :bartab

  def initialize(name, rooms, til, drinks, bartab)
      @name = name
      @rooms = rooms
      @drinks = drinks
      @til = til
      @bartab = bartab
  end


def pay_for_entrance(guest)
  return "Not enough money" unless guest.wallet >= 20
  @til += 20
  guest.wallet -= 20
end


def sell_drink(drink, guest)
  guest.wallet -= drink.pric
  @bartab += drink.price
  return @bartab
end



end
