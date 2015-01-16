class LookupGameForClient
  include SuckerPunch::Job

  def perform(game_to_lookup)
    puts "Looking up #{game_to_lookup}"
    retrieved_game = GameLookup.new.perform(game_to_lookup)
    return if retrieved_game.nil?
    WebsocketRails[:games].trigger(:new_game, HltbWithSteamPlaytime.new(retrieved_game, game_to_lookup))
  end

  def later(sec, args)
    after(sec) {perform(args)}
  end
end
