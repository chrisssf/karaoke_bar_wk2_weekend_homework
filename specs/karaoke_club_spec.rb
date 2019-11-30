require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require('pry')
require_relative("../karaoke_club")
require_relative("../room")
# require_relative("../guest")
# require_relative("../song")


class KaraokeClubTest < MiniTest::Test

  def setup
    @room = Room.new("Pop Room", 30)
    @room2 = Room.new("Rock Room", 10)
    @karaoke_club = KaraokeClub.new([@room])
  end

  def test_karaoke_club_has_rooms
    assert_equal(1, @karaoke_club.how_many_rooms)
  end

  def test_return_room_names
    assert_equal(["Pop Room"], @karaoke_club.return_room_names)
  end

  def test_add_a_room
    @karaoke_club.add_a_room(@room2)
    assert_equal(2, @karaoke_club.how_many_rooms)
  end

  def test_remove_a_room
    @karaoke_club.add_a_room(@room2)
    assert_equal([@room], @karaoke_club.remove_a_room(@room2))
  end

  def test_update_total_till
    @karaoke_club2 = KaraokeClub.new([@room, @room2])
    assert_equal(200, @karaoke_club2.update_total_till)
  end
end
