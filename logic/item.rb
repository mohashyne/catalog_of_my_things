require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :archived, :publish_date

  def initialize(id, publish_date)
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

def can_be_archived?
  current_date = Date.today
  years = current_date.year - @publish_date.year
  years > 10
end

def move_to_archive
  return unless can_be_archived?

  @archived = true
end
