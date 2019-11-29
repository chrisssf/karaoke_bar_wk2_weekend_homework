require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require('pry')
require_relative("../room")
require_relative("../guest")
require_relative("../song")


class RoomTest < MiniTest::Test

  def setup
    @room = Room.new("Pop Room", 30)
    # @room2 = Room.new("Pop Room", 2)
    @song = Song.new("Walk the Line", "Johnny Cash", "Country")
    @song2 = Song.new("Ring of Fire","Johnny Cash", "Country")
    @guest = Guest.new("Chris", 100, @song)
    @guest2 = Guest.new("Dave", 50, @song)
    @guest3 = Guest.new("Bob", 80, @song)


  end

  def test_room_has_name
    assert_equal("Pop Room", @room.name)
  end

  def test_room_has_max_guests
    assert_equal(30, @room.max_guests)
  end

  def test_room_has_songs
    @room.add_a_song_to_room(@song)
    assert_equal([@song], @room.current_songs)
  end

  def test_add_a_song
    @room.add_a_song_to_room(@song)
    assert_equal(1, @room.current_songs.length)
  end

  def test_remove_a_song
    @room.add_a_song_to_room(@song)
    @room.add_a_song_to_room(@song2)
    assert_equal([@song], @room.remove_a_song(@song2))
  end

  def test_room_starts_empty
    assert_equal(0, @room.current_guests)
  end

  def test_guest_can_check_in
    assert_equal(["Chris"], @room.check_in_guest(@guest))
  end

  def test_guest_can_check_out
    @room.check_in_guest(@guest)
    @room.check_in_guest(@guest2)
    assert_equal(["Chris"], @room.check_out_guest(@guest2))
  end

  def test_room_is_full
    @room2 = Room.new("Pop Room", 2)
    @room2.check_in_guest(@guest)
    @room2.check_in_guest(@guest2)
    @room2.check_in_guest(@guest3)
    assert_equal("Sorry this room is full!", @room2.room_full)
  end



end
