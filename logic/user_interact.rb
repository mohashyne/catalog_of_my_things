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
    puts "\nEnter day"
    day = gets.chomp
    Date.parse("#{year}-#{month}-#{day}")
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

  def on_spotify
    puts "\nIs the album available on Spotify? (yes/no)"
    gets.chomp.downcase == 'yes'
  end
end
