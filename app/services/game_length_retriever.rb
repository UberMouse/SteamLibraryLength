require 'hltb/client'

class GameLengthRetriever
  LOOKUP_RATE = 2.seconds
  
  def initialize
    @client = HLTB::Client.new
  end

  def call(games)
    app_ids = games.map(&:app_id)
    existing_games = Game.where(app_id: app_ids)
    need_lookup = games.select{|g| !existing_games.any?{|eg| eg.app_id == g.app_id}}
    need_lookup.each_with_index(&method(:lookup))

    existing_games
  end

  private
  def lookup(game, index)
    LookupGameForClient.new.async.later(index * LOOKUP_RATE, game)
  end
end
