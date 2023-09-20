require_relative '../file_helper'

module AuthorData
  FILENAME = 'author.json'.freeze
  include FileManager
  def author_to_json(authors)
    {
      id: authors.id,
      first_name: authors.first_name,
      last_name: authors.last_name,
      items: authors.items.map(&:id)
    }
  end

  def json_to_author(data_json)
    Author.new(data_json['id'], data_json['first_name'], data_json['last_name'])
  end

  def read_authors
    data = read_file(file(FILENAME))
    data.map { |items| json_to_author(items) }
  end

  def save_authors(authors)
    data = authors.map { |items| author_to_json(items) }
    write_file(file(FILENAME), data)
  end
end
