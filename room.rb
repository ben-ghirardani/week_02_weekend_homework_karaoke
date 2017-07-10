class Room

  attr_reader :room_name, :room_number, :room_capacity, :price_per_person, :current_occupants, :playlist

  def initialize(room_name, room_number, room_capacity, price_per_person)
    @room_name = room_name
    @room_number = room_number
    @room_capacity = room_capacity
    @price_per_person = price_per_person
    @current_occupants = []
    @playlist = []
  end



end
