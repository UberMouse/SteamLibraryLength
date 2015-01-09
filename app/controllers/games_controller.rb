require 'steam/library_retriever'

class GamesController < ApplicationController
  def load_games
    games = Steam::LibraryRetriever.new.call(message[:steam_id])
    existing_games = GameLengthRetriever.new.call(games)

    trigger_success({total_games: games.length, games: existing_games})
  end
end
