require_relative 'item'
require 'date'

class Game < item
    attr_accessor :multiplayer , :last_played_at

    def initialize(id, publish_date, multiplayer, last_played_at)
        super(id, publish_date)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    def
end

