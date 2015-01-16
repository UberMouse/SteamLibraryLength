class HltbWithSteamPlaytime
  def initialize(game, steam_game)
    @game = game
    @steam_game = steam_game
  end

  def to_json
    {
      app_id: @game.app_id,
      name: @game.name,
      main_length: @game.main_length,
      main_with_extras_length: @game.main_with_extras_length,
      completionist_length: @game.completionist_length,
      game_found_on_hltb: @game.game_found_on_hltb,
      playtime: (@steam_game.playtime_forever / 60.0).round(1)
    }
  end
end
