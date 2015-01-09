require 'steam/game'

FactoryGirl.define do
  factory :steam_game, class: Steam::Game do
    ignore do
      app_id 1
      name "Test"
      playtime_forever 5
      display_img_url  "http://foo.baz/test.png"
    end

    initialize_with{ Steam::Game.new(app_id, name, playtime_forever, display_img_url) }
  end

  factory :dods, parent: :steam_game do
    app_id 300
    name "Day of Defeat: Source"
    playtime_forever 47
    display_img_url "http://media.steampowered.com/steamcommunity/public/images/apps/300/e3a4313690bd551495a88e1c01951eb26cec7611.jpg"
  end

  factory :ziggurat, parent: :steam_game do
    app_id 308420
    name "Ziggurat"
    playtime_forever 135
    display_img_url "http://media.steampowered.com/steamcommunity/public/images/apps/308420/b07c41cc37ed95263c03e567bd659aa391d7b82d.jpg"
  end
end
