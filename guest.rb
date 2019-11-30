class Guest

  attr_reader :name, :wallet, :favorite_song

  def initialize(name, wallet, favorite_song)
    @name = name
    @wallet = wallet
    @favorite_song = favorite_song
  end

  def take_money_from_guest(amount)
    @wallet -= amount
  end


end
