class AddGameFoundOnHltbToGames < ActiveRecord::Migration
  def change
    add_column :games, :game_found_on_hltb, :boolean
  end
end
