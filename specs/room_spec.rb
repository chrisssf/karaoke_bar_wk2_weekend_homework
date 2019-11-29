require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")

class RoomTest < MiniTest::Test

  def setup
    @room = Room.new("Pop Room", 30)
  end

  def test_room_has_name
    assert_equal("Pop Room", @room.name)
  end

  def test_room_has_max_guests
    assert_equal(30, @room.max_guests)
  end


end
