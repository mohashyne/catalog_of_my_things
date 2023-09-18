require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :archived, :publish_date

  def initialize (id, genre, author, source, label, publish_date, archived)
    @id = id
    @publish_date = publish_date
    @archived = false
    @genre = nil
    @label = nil
    @author = nil
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self)
  end

  def add_label(label)
    @label = label
    author.add_item(self)
  end

  def add_source; end
end