require 'hltb/client'

class GameLookup
  include SuckerPunch::Job

  def initialize()
    @client = HLTB::Client.new
  end

  def perform(game)
    hltb_game = @client.lookup(game.name)
    if hltb_game.nil?
      puts "No result for #{game}"
      return
    end

    ActiveRecord::Base.connection_pool.with_connection do
      @game_model = Game.create(
        appid: game.appid,
        name: game.name,
        main_length: hltb_game.main_length,
        main_with_extras_length: hltb_game.main_with_extras_length,
        completionist_length: hltb_game.completionist_length
      )
    end

    @game_model
  end
end
