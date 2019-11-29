require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")
require_relative("../song")


class GuestTest < MiniTest::Test

  def setup
    @song = Song.new("Walk the Line","Johnny Cash", "Country")
    @guest = Guest.new("Chris", 100, @song)
  end

  def test_guest_has_name
    assert_equal("Chris", @guest.name)
  end

  def test_guest_has_wallet
    assert_equal(100, @guest.wallet)
  end

  def test_guest_has_favorite_song
    assert_equal("Walk the Line", @guest.favorite_song.name)
  end


end
