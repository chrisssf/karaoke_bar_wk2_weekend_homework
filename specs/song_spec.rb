require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../song")

class SongTest < MiniTest::Test


  def setup
    @song = Song.new("Walk the Line","Johnny Cash", "Country")
  end

 def test_song_has_name
   assert_equal("Walk the Line", @song.name)
 end

 def test_song_has_artist
    assert_equal("Johnny Cash", @song.artist)
 end

 def test_song_has_genre
    assert_equal("Country", @song.genre)
 end




end
