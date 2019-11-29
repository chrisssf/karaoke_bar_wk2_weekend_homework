class KaraokeClub

  def initialize(rooms)
    @rooms = rooms
  end

  def how_many_rooms
    return @rooms.length
  end

  def return_room_names
    room_names = []
    @rooms.each {|room| room_names.push(room.name)}
    return room_names
  end

end
