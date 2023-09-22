require_relative 'data/book_data'
require_relative 'data/label_data'
require_relative 'data/music_album_data'
require_relative 'data/genre_data'
require_relative 'data/games_data'
require_relative 'data/authors_data'

module DataManager
  include LabelData
  include BooksData
  include MusicAlbumData
  include GenreData
  include AuthorData
  include GameData
end
