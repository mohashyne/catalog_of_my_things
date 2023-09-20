class CheckData
  def check_list_books(books)
    puts "\nBook List:"
    if books.empty?
      puts "\nNo books available"
      return nil
    end

    books.each_with_index do |book, idx|
      puts "\n#{idx}) " \
           "ID: #{book.id}, " \
           "Label: #{book.label.title}, " \
           "Publish Date: #{book.publish_date}, " \
           "Publisher: #{book.publisher}, " \
           "Cover State: #{book.cover_state}"
    end
  end

  def check_list_labels(labels)
    puts "\nLabel List:"
    if labels.empty?
      puts "\nNo Labels available"
      return nil
    end

    labels.each_with_index do |label, idx|
      puts "\n#{idx}) " \
           "ID: #{label.id}, " \
           "Title: #{label.title}, " \
           "Color: #{label.color}, "
    end
  end

  def check_list_albums(albums)
    puts "\nAlbum List:"
    if albums.empty?
      puts "\nNo albums available."
      return nil
    end

    albums.each_with_index do |album, idx|
      puts "\n#{idx}) " \
           "ID: #{album.id}, " \
           "Label: #{album.label.title}, " \
           "Publish Date: #{album.publish_date}, " \
           "On Spotify: #{album.on_spotify}"
    end
  end

  def check_list_genres(genres)
    puts "\nGenre List:"
    if genres.empty?
      puts "\nNo genres available."
      return nil
    end

    genres.each_with_index do |genre, idx|
      puts "\n#{idx}) " \
           "ID: #{genre.id}, " \
           "Name: #{genre.name}"
    end
  end

  def check_list_games(games)
    puts "\nGame List:"
    if games.empty?
      puts "\nNo games available."
      return nil
    end

    games.each_with_index do |game, idx|
      puts "\n#{idx}) " \
           "ID: #{game.id}, " \
           "Label: #{game.label.title}, " \
           "Publish Date: #{game.publish_date}, " \
           "Multiplayer: #{game.multiplayer}, " \
           "Last Played At: #{game.last_played_at}"
    end
  end

  def check_list_authors
    puts "\nAuthor List:"
    if @authors
      puts "\nNo authors available."
      return nil
    end

    authors.each_with_index do |author, idx|
      puts "\n#{idx}) " \
           "ID: #{author.id}, " \
           "First Name: #{author.first_name}, " \
           "Last Name: #{author.last_name}"
    end
  end
end
