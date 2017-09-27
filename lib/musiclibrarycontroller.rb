class MusicLibraryController

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def list_songs
    sorted = Song.all.sort_by{|i| i.name}
    sorted.each_with_index {|song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
  end

  def list_artists
    sorted = Artist.all.sort_by{|i| i.name}
    sorted.each_with_index {|artist, i|
      puts "#{i + 1}. #{artist.name}"
    }
  end

  def list_genres
    sorted = Genre.all.sort_by{|i| i.name}
    sorted.each_with_index {|genre, i|
      puts "#{i + 1}. #{genre.name}"
    }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    # binding.pry
    if Artist.find_by_name(input) do
      Artist.find_by_name(input).songs.each_with_index do |song, i|
        puts "#{i + 1}. #{song} - #{genre}"
      end
    end
  end
end


  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.chomp  until input == "exit"
  end
end
