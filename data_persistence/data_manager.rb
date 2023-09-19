require_relative 'data/book_data'
require_relative 'data/label_data'

module DataManager
  include LabelData
  include BooksData
end
