require_relative('./guest')
require_relative('./room')
require_relative('./songs')
require('pry')

room1 = Room.new("Room 1", 1, 4, 10)
room2 = Room.new("Room 2", 2, 6, 15)
room3 = Room.new("Room 3", 3, 8, 20)
room4 = Room.new("Room 4", 4, 12, 22)

@code_clan_karaoke = [room1, room2, room3, room4]

song1 = Song.new("Wannabe")
song2 = Song.new("Say You'll Be There")
song3 = Song.new("2 Become 1")
song4 = Song.new("Mama")
song5 = Song.new("Who Do You Think You Are")
song6 = Song.new("Move Over")
song7 = Song.new("Spice Up Your Life")
song8 = Song.new("Too Much")
song9 = Song.new("Stop")
song10 = Song.new("Viva Forever")
song11 = Song.new("Let Love Lead the Way")
song12 = Song.new("Holler")

@song_list = [song1, song2, song3, song4, song5, song6, song7, song8, song9, song10, song11, song12]

guest1 = Guest.new("Sly", "Who Do You Think You Are")
guest2 = Guest.new("Debbie", "Viva Forever")
guest3 = Guest.new("Oswald", "Wannabe")
guest4 = Guest.new("Lauren", "Holler")
guest5 = Guest.new("Emmet", "Too Much")
guest6 = Guest.new("Laci", "Let Love Lead the Way")
guest7 = Guest.new("John", "Say You'll Be There")
guest8 = Guest.new("Isobel", "Stop")
guest9 = Guest.new("Claude", "2 Become 1")
guest10 = Guest.new("Nichole", "Spice Up Your Life")
guest11 =Guest.new("Carson", "Mama")
guest12 = Guest.new("Jenifer", "Move Over")

@potential_guest_list = [guest1, guest2, guest3, guest4, guest5, guest6, guest7, guest8, guest9, guest10, guest11, guest12]

# creates an array with a random number of guests from @potential_guest_list. DOES MY RAND PICK BETWEEN THE FULL RANGE?


@actual_guest_list = @potential_guest_list.sample(rand(1..12))

  def actual_guest_names
    @actual_guest_list.each do |guest|
    p guest.name  
    end
  end

puts "Welcome to CodeClan Karaoke! #{@actual_guest_list.length} guests have arrived."

actual_guest_names

puts "Please enter the number of guests would you like to book in?"

@number_of_guests = gets.chomp.to_i

    def room_capacity_check
      @code_clan_karaoke.each do |room|
        if room.room_capacity >= @number_of_guests
         puts "#{room.room_name} is available. The price for #{room.room_name} is £#{room.price_per_person} per person, which is £#{room.price_per_person * @number_of_guests}."
        end
      end
    end

room_capacity_check

puts "Please enter the number of the room you woud like to book."

@room_selection = gets.chomp.to_i

# add in logic to prevent an ineligable room from being selected.

if @room_selection == 1 
  puts "You have selected Room 1, your guests will now be shown into their room."
elsif @room_selection == 2
  puts "You have selected Room 2, your guests will now be shown into their room."
elsif @room_selection == 3
  puts "You have selected Room 3, your guests will now be shown into their room."
elsif @room_selection == 4
  puts "You have selected Room 4, your guests will now be shown into their room"
else
  puts "I'm sorry, your selection wasn't recognised, please try again."
end

  def put_people_into_the_room
    @actual_guest_list.each do |guest|
      guestlist = guest.name
      @code_clan_karaoke.each do |room|
       if room.room_number == @room_selection
        room.current_occupants << guestlist
       end
      end
    end
  end

put_people_into_the_room

puts "The guests have entered the room."

  def show_people_in_room
    @code_clan_karaoke.each do |room|
     if room.room_number == @room_selection
      p room.current_occupants
     end
     end
  end

show_people_in_room

puts "Press y to load the guests favourite songs onto the playlist for your chosen room."  

@song_upload_decision = gets.chomp
# above will be "y" or "something else". Need to provide option for both.

  def put_favourite_songs_onto_playlist_for_room_chosen
      @actual_guest_list.each do |guest|
        playlist = guest.favourite_song
       @code_clan_karaoke.each do |room|
        if room.room_number == @room_selection
          room.playlist << playlist
        end
      end
    end
  end      
          
# this doesn't rely on @song_upload_decision yet. Need to edit.
put_favourite_songs_onto_playlist_for_room_chosen

  def show_playlist
    @code_clan_karaoke.each do |room|
     if room.room_number == @room_selection
      p room.playlist
     end
     end
  end

show_playlist

puts "Some"
puts " "
puts "time"
puts " "
puts "passes"
puts " "
puts " "
puts "Your guests are ready to leave. Press y to empty the room and clear the playlist."

@empty_room_and_clear_playlist = gets.chomp

def guests_leave_playlist_cleared
  @code_clan_karaoke.each do |room|
   if (room.room_number == @room_selection) && (@empty_room_and_clear_playlist == "y")
room.playlist.clear & room.current_occupants.clear
   end
end
end

guests_leave_playlist_cleared

show_people_in_room

show_playlist