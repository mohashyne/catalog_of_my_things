require_relative 'item'


class Author 
    attr_accessor :id, :first_name, :last_name
    attr_reader :items

    def initialize(id, first_name, last_name)
        @id = id
        @first_name = first_name
        @last_name = last_name
        @items = []
    end

    def add_item(item)
        @items << item
        item.author = self
    end
end