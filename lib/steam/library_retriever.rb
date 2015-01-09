require 'steam/game'

module Steam
  class LibraryRetriever
    def call(steam_id)
      resp = Steam::Player.owned_games(steam_id, params: {include_appinfo: 1})
      resp["games"].map(&method(:parse))
    end

  private
    def parse(game)
      app_id = game["appid"]
      image_url = make_image_url(app_id, game["img_logo_url"])
      Steam::Game.new(app_id, game["name"], game["playtime_forever"], image_url)
    end

    def make_image_url(app_id, img_logo_url)
      "http://media.steampowered.com/steamcommunity/public/images/apps/#{app_id}/#{img_logo_url}.jpg"
    end
  end
end
