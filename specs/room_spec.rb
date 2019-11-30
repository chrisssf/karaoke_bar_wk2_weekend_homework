require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require('pry')
require_relative("../room")
require_relative("../guest")
require_relative("../song")
require_relative("../karaoke_club")



class RoomTest < MiniTest::Test

  def setup
    @room = Room.new("Pop Room", 30)
    @karaoke_club = KaraokeClub.new([@room])
    @room2 = Room.new("Pop Room", 3)
    @song = Song.new("Walk the Line", "Johnny Cash", "Country")
    @song2 = Song.new("Ring of Fire","Johnny Cash", "Country")
    @room3 = Room.new("Dance Room" , 20, 10, [@song, @song2])
    @guest = Guest.new("Chris", 100, @song)
    @guest2 = Guest.new("Dave", 50, @song)
    @guest3 = Guest.new("Bob", 5, @song)
  end

  def test_room_has_name
    assert_equal("Pop Room", @room.name)
  end

  def test_room_has_max_guests
    assert_equal(30, @room.max_guests)
  end

  def test_room_has_songs
    @room.add_a_song_to_room(@song)
    @room.add_a_song_to_room(@song2)
    assert_equal([@song, @song2], @room.current_songs)
  end

  def test_add_a_song
    @room.add_a_song_to_room(@song)
    @room.add_a_song_to_room(@song2)
    assert_equal(2, @room.current_songs.length)
  end

  def test_remove_a_song
    @room.add_a_song_to_room(@song)
    @room.add_a_song_to_room(@song2)
    assert_equal([@song], @room.remove_a_song(@song2))
  end

  def test_room_starts_empty
    assert_equal(0, @room.current_guest_count)
  end

  def test_can_guest_afford_entry_fee
    assert_equal(true, @room.can_afford_entry_fee(@guest))
    assert_equal(false, @room.can_afford_entry_fee(@guest3))
  end

  def test_take_money_from_guest
    assert_equal(90, @guest.take_money_from_guest(@room.entry_fee))
  end

  def test_guest_can_check_in
    assert_equal(["Chris"], @room.add_a_guest(@guest))
  end

  def test_guest_can_check_out
    @room.add_a_guest(@guest)
    @room.add_a_guest(@guest2)
    assert_equal(["Chris"], @room.check_out_guest(@guest2))
  end

  def test_room_is_full
    # @room2 = Room.new("Pop Room", 3)
    @room2.add_a_guest(@guest)
    @room2.add_a_guest(@guest2)
    @room2.add_a_guest(@guest3)
    assert_equal("Sorry this room is full!", @room2.room_full)
    assert_equal(false, @room.room_full)
  end

  def test_room_has_favorite_song
    assert_equal("WHOO, I love this song!", @room3.plays_favorite_song(@guest))
  end

  def test_check_in_a_guest
    @room.check_in_guest(@guest)
    assert_equal(1, @room.current_guest_count)
    assert_equal(90, @guest.wallet)
    assert_equal(110, @room.room_till)
    assert_equal("Guest checked in!", @room2.check_in_guest(@guest2))
    assert_equal("Sorry, you don't have enough money", @room.check_in_guest(@guest3))
  end

end
