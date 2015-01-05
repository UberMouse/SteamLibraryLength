require 'hltb/game'

FactoryGirl.define do
  factory :hltb_game, class: HLTB::Game do
    ignore do
      name "Test"
      url  "http://foo.baz"
      main_length 5
      main_with_extras_length 7.5
      completionist_length 15
    end

    initialize_with{ HLTB::Game.new(name, url, main_length, main_with_extras_length, completionist_length) }
  end

  factory :metal_gear_rising, parent: :hltb_game do
    name "Metal Gear Rising: Revengeance"
    url "http://howlongtobeat.com/game.php?id=5905"
    main_length 6.5
    main_with_extras_length 9.5
    completionist_length 25
  end

  factory :braid, parent: :hltb_game do
    name "Braid"
    url "http://howlongtobeat.com/game.php?id=1290"
    main_length 5
    main_with_extras_length 6
    completionist_length 7
  end
end
