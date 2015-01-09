require 'steam/game'

module Steam
  class LibraryRetriever
    def call(steam_id)
      resp = Steam::Player.owned_games(steam_id, params: {include_appinfo: 1})
      resp["games"].map(&method(:parse))
    end

  private
    def parse(game)
      image_url = make_image_url(game["appid"], game["img_logo_url"])
      Steam::Game.new(game["name"], game["playtime_forever"], image_url)
    end

    def make_image_url(appid, img_logo_url)
      "http://media.steampowered.com/steamcommunity/public/images/apps/#{appid}/#{img_logo_url}.jpg"
    end
  end
end
