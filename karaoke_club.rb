class KaraokeClub

attr_reader :total_till

  def initialize(rooms)
    @rooms = rooms
    @total_till = 0
  end

  def how_many_rooms
    return @rooms.length
  end

  def return_room_names
    room_names = []
    @rooms.each {|room| room_names.push(room.name)}
    return room_names
  end

  def add_a_room(room)
    @rooms.push(room)
  end

  def remove_a_room(room)
    @rooms.delete(room)
    return @rooms
  end

  def update_total_till
    total = 0
    @rooms.each {|room| total += room.room_till}
    @total_till = total
  end


end
