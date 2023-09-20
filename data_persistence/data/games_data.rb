require_relative '../file_helper'

module GameData
  include FileManager

  def game_to_json(games)
    {
      id: games.id,
      publish_date: games.publish_date,
      multiplayer: games.multiplayer,
      last_played_at: games.last_played_at,
      author: { id: games.author.id,
                first_name: games.author.first_name,
                last_name: games.author.last_name }
    }
  end

  def json_to_games(data_json, author)
    game = Game.new(data_json['id'], data_json['publish_date'], data_json['multiplayer'],
                    data_json['last_played_at'])
    game.add_author(author)
    game
  end

  def read_all_game(authors)
    data = read_file(file(FILENAME))
    data.map { |items| json_to_games(items, authors.find { |item2| items['author']['id'] == item2.id }) }
  end

  def save_game(games)
    data = games.map { |game| author_to_json(game) }
    write_file(file(FILENAME), data)
  end
end
