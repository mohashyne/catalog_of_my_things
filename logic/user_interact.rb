require 'date'
class UserInteract
  def option
    puts "\n"
    puts 'Select your option'
    gets.chomp.to_i
  end

  def publish_date(msj)
    puts "\n#{msj}"
    puts "\nEnter the year"
    year = gets.chomp
    puts "\nEnter month in numbers, eg.: 04 for April"
    month = gets.chomp
    puts "\nEnter date"
    day = gets.chomp
    Date.parse("#{year}-#{month}-#{day}")
  end

  def on_spotify?
    puts "\nIs your album on Spotify (Y/N)?"
    input = gets.chomp
    to_cap_letter = input.capitalize
    to_cap_letter == 'Y'
  end

  def add_genre
    puts "\nPlease write the Music Genre you want to add"
    input = gets.chomp
    input.capitalize
    input
  end

  def select_genre
    gets.chomp
  end

  def title
    puts "\nAdd the Label title"
    gets.chomp
  end

  def color
    puts "\nAdd the Label color"
    gets.chomp
  end

  def publisher
    puts "\nAdd the Publisher"
    gets.chomp
  end

  def cover_state
    puts "\nSelect the Cover State"
    puts '1) Bad'
    puts '2) Good'
    selected_option = gets.chomp.to_i
    cover = nil
    case selected_option
    when 1 then cover = 'bad'
    when 2 then cover = 'good'
    else
      puts "\nInvalid option..."
    end
    cover
  end

  def select_label
    puts 'Select a Label from the above list by the index [not id] or press (n) if you need to add a new one'
    gets.chomp
  end

  def multiplayer
    loop do
      puts "\nThe game it is multiplayer (Y)es (N)o"
      choose = gets.chomp
      if %w[Y y].include?(choose)
        return true
      elsif %w[N n].include?(choose)
        return false
      else
        puts 'Invalid option, try again'
      end
    end
  end

  def name
    puts "\nEnter author name"
    gets.chomp
  end

  def lname
    puts "\nEnter author last name"
    gets.chomp
  end

  def select_author
    puts 'Select author by the index [not id] or press (n) if you need to add a new one'
    gets.chomp
  end
end
