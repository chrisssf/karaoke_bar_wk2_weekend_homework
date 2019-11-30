class Room

  attr_reader :name, :max_guests, :entry_fee, :room_till


  def initialize(name, max_guests, entry_fee = 10, songs = [])
    @name = name
    @max_guests = max_guests
    @entry_fee = entry_fee
    @songs = songs
    @room_till = 100
    @current_guests = []
  end

 def current_guest_count
   return @current_guests.length
 end

 def add_a_song_to_room(song)
   return @songs << song
 end

 def remove_a_song(song)
   @songs.delete(song)
   return @songs
 end

 def current_songs
   return @songs
 end

 def can_afford_entry_fee(guest)
   return guest.wallet >= @entry_fee
 end

 def add_a_guest(guest)
   return @current_guests << guest.name
 end

 def check_out_guest(guest)
   @current_guests.delete(guest.name)
   return @current_guests
 end

 def room_full
   if @current_guests.length >= @max_guests
     return "Sorry this room is full!"
   else
     return false
   end
 end

 def plays_favorite_song(guest)
   @songs.each do |song|
     if song == guest.favorite_song
       return "WHOO, I love this song!"
     end
   end
 end

 def put_money_into_till(amount)
   @room_till += amount
 end

 def check_in_guest(guest)
    if can_afford_entry_fee(guest)
      guest.take_money_from_guest(@entry_fee)
      add_a_guest(guest)
      put_money_into_till(@entry_fee)
      return "Guest checked in!"
    else
      return "Sorry, you don't have enough money"
    end
 end



end
