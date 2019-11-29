class Room

  attr_reader :name, :max_guests

  def initialize(name, max_guests, songs = [])
    @name = name
    @max_guests = max_guests
    @songs = songs
    @current_guests = []
  end

 def current_guests
   return @current_guests.length
 end

 def add_a_song_to_room(song)
   @songs << song
   return @songs
 end

 def remove_a_song(song)
   @songs.delete(song)
   return @songs
 end

 def current_songs
   return @songs
 end

 def check_in_guest(guest)
   @current_guests << guest.name
   return @current_guests
 end

 def check_out_guest(guest)
   @current_guests.delete(guest.name)
   return @current_guests
 end

 def room_full
   if @current_guests.length >= @max_guests
     return "Sorry this room is full!"
 end

 end





end
