require 'hltb/client'

class GameLengthRetriever
  LOOKUP_RATE = 2.seconds
  
  def initialize
    @client = HLTB::Client.new
  end

  def call(games)
    appids = games.map(&:appid)
    existing_games = Game.where(appid: appids)
    need_lookup = games.select{|g| !existing_games.any?{|eg| eg.appid == g.appid}}
    need_lookup.each_with_index(&method(:lookup))

    existing_games
  end

  private
  def lookup(game, index)
    LookupGameForClient.new.async.later(index * LOOKUP_RATE, game)
  end
end
