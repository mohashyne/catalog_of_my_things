require_relative 'data_persistence/data_manager'
require_relative 'logic/label'
require_relative 'logic/book'
require_relative 'logic/checkdata'
require_relative 'logic/user_interact'
require_relative 'logic/music_album'
require_relative 'logic/genre'

class App
  include DataManager

  def initialize
    @labels = read_all_labels
    @books = read_all_books(@labels)
    @u_interact = UserInteract.new
    @check = CheckData.new
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

  def finish
    save_book(@books) unless @books.empty?
    save_label(@labels) unless @labels.empty?
  end
end
