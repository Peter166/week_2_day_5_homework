require('minitest/autorun')
require('minitest/reporters')


require_relative("../caraoke_bar")
require_relative("../guest")
require_relative("../room")
require_relative("../song")
require_relative("../drink")
require_relative("../bar_tab")


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestCaraokeBar < MiniTest::Test

  def setup
    @guest_1 = Guest.new('Tom', 10, 'Eye of the tiger')
    @guest_2 = Guest.new('Bob', 20, "I'm still standing")
    @guest_3 = Guest.new('Roger', 30, "Stayin' alive")

    @drink_1 = Drink.new("Becks", 5)

    @bar_tab = BarTab.new(0)

    @song_1 = Song.new('Eye of the tiger')
    @song_2 = Song.new("I'm still standing")
    @song_3 = Song.new("Stayin' alive")

    @room_1 = Room.new(1, [@song_1], [@guest_1], @drink_1)
    @room_2 = Room.new(2, [@song_2], [@guest_2], @drink_1)
    @room_3 = Room.new(3, [@song_3], [@guest_3], @drink_1)


    @caraoke_bar = CaraokeBar.new('Go funk yourself',[@room_1, @room_2, @room_3], 50, @drink_1, 0)

  end

  def test_name_of_the_bar
    assert_equal("Go funk yourself", @caraoke_bar.name)
  end

  def test_check_in
    assert_equal(2, @room_1.check_in(@guest_2).count())
  end

  def test_check_out
    assert_nil(@room_1.check_out(@quest_2))
  end

  def test_add_song
    assert_equal(2, @room_1.add_song(@song_2).count())
  end

  def test_capacity
    @room_1.check_in(@guest_2)
    @room_1.check_in(@guest_2)
    assert_equal('room in full.', @room_1.check_in(@guest_3))
  end

  def test_pay_for_entrance
    assert_equal("Not enough money", @caraoke_bar.pay_for_entrance(@guest_1))

  end

  def test_pay_for_entrance_2
    @caraoke_bar.pay_for_entrance(@guest_2)
    assert_equal(70, @caraoke_bar.til)

  end

  def test_fav_song_cheer
    assert_equal("Wohoo!", @guest_1.fav_song_cheer(@room_1))

  end


  def test_sell_drink
    assert_equal(5, @caraoke_bar.sell_drink(@drink_1, @guest_3))
  end
end
