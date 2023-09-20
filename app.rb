require_relative 'data_persistence/data_manager'
require_relative 'logic/label'
require_relative 'logic/book'
require_relative 'logic/checkdata'
require_relative 'logic/user_interact'
require_relative 'logic/music_album'
require_relative 'logic/genre'
require_relative 'logic/author'
require_relative 'logic/game'

class App
  include DataManager

  def initialize
    @labels = read_all_labels
    @books = read_all_books(@labels)
    @u_interact = UserInteract.new
    @check = CheckData.new
    @albums = read_all_albums(@labels)
    @genres = read_all_genres
    @authors = read_all_authors
    @games = read_all_game(@authors)
  end

  def list_books
    @check.check_list_books(@books)
  end

  def list_labels
    @check.check_list_labels(@labels)
  end

  def add_label
    new_label
    puts 'label created successfully'
  end

  def new_label
    id = Random.rand(1..1000)
    title = @u_interact.title
    color = @u_interact.color

    label = Label.new(id, title, color)
    @labels << label

    label
  end

  def add_book
    new_book
    puts "\nBook created successfully"
  end

  def new_book
    id = Random.rand(1..1000)
    publish_date = @u_interact.publish_date('Enter publish date')
    publisher = @u_interact.publisher
    cover_state = @u_interact.cover_state
    label = nil

    if @labels.empty?
      label = new_label
    else
      list_labels
      label_option_selected = @u_interact.select_label
      if %w[n N].include?(label_option_selected)
        label = new_label
      else
        label_index = label_option_selected.to_i
        label = @labels[label_index]
      end
    end

    book = Book.new(id, publish_date, publisher, cover_state)
    book.add_label(label)
    @books << book
  end

  def list_albums
    @check.check_list_albums(@albums)
  end

  def list_genres
    @check.check_list_genres(@genres)
  end

  def add_album
    new_album
    puts "\nAlbum added successfully."
  end

  def new_album
    id = Random.rand(1..1000)
    publish_date = @u_interact.publish_date('Enter publish date for the album')
    on_spotify = @u_interact.on_spotify
    label = select_or_create_label

    album = MusicAlbum.new(id, publish_date, on_spotify)
    album.add_label(label)
    @albums << album
  end

  def select_or_create_label
    if @labels.empty?
      new_label
    else
      list_labels
      label_option_selected = @u_interact.select_label
      if %w[n N].include?(label_option_selected)
        new_label
      else
        label_index = label_option_selected.to_i
        @labels[label_index]
      end
    end
  end

  def list_authors
    @check.check_list_authors(@authors)
  end

  def list_games
    @check.check_list_games(@games)
  end

  def add_game
    new_game
    puts "\nGame added successfully."
  end

  def new_game
    id = Random.rand(1..1000)
    publish_date = @u_interact.publish_date('Enter publish date for the game')
    multiplayer = @u_interact.multiplayer
    last_played_date = @u_interact.publish_date('Enter Last Played date')
    if @authors.empty?
      author = add_author
    else
      list_authors
      aut_choose = @u_interact.select_author
      author = if %w[n N].include?(aut_choose)
                 add_author
               else
                 @authors[aut_choose.to_i]
               end
    end
    game = Game.new(id, publish_date, multiplayer, last_played_date)
    game.add_author(author)
    @games << game
  end

  def add_author
    id = Random.rand(5000..10_000)
    first_name = @u_interact.name
    last_name = @u_interact.last_name

    author = Author.new(id, first_name, last_name)
    @authors << author
    author
  end

  def finish
    save_book(@books) unless @books.empty?
    save_label(@labels) unless @labels.empty?
    save_album(@albums) unless @albums.empty?
    save_genre(@genres) unless @genres.empty?
    save_game(@games)  unless @games.empty?
    save_authors(@authors) unless @authors.empty?
  end
  
end
