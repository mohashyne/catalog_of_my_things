class UserInterfaceActions
  def initialize(application)
    @application = application
  end

  def menu_options
    puts "\nPlease choose an option by entering a number:
      1. List all books
      2. List all music albums
      3. List of games
      4. List all genres
      5. List all labels
      6. List all authors
      7. Add a book
      8. Add a music album
      9. Add a game
      10. Exit"
    gets.chomp.strip.to_i
  end

  def menu
    loop do
      option = menu_options
      case option
      when 1 then @application.list_books
      when 2 then @application.list_albums
      when 3 then @application.list_games
      when 4 then @application.list_genres
      when 5 then @application.list_labels
      when 6 then @application.list_authors
      when 7 then @application.add_book
      when 8 then @application.add_album
      when 9 then @application.add_game
      else
        @application.finish
        puts 'Thank you for using this app!'
        break
      end
    end
  end
end
