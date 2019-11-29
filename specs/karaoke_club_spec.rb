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
    @karaoke_club = KaraokeClub.new([@room])
  end

  def test_karaoke_club_has_rooms
    assert_equal(1, @karaoke_club.how_many_rooms)
  end

  def test_return_room_names
    assert_equal(["Pop Room"], @karaoke_club.return_room_names)
  end

end
