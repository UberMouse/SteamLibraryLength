require 'hltb/client'

class GameLookup
  include SuckerPunch::Job

  def initialize()
    @client = HLTB::Client.new
  end

  def perform(game)
    hltb_game = @client.lookup(game.name)
    game_found = true
    if hltb_game.nil?
      puts "No result for #{game}"
      hltb_game = OpenStruct.new(main_length: 0, main_with_extras_length: 0, completionist_length: 0)
      game_found = false
    end

    ActiveRecord::Base.connection_pool.with_connection do
      @game_model = Game.create(
        app_id: game.app_id,
        name: game.name,
        main_length: hltb_game.main_length,
        main_with_extras_length: hltb_game.main_with_extras_length,
        completionist_length: hltb_game.completionist_length,
        game_found_on_hltb: game_found
      )
    end

    @game_model
  end
end
