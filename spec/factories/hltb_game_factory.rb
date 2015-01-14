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
    completionist_length 25.5
  end
  
  factory :metal_gear_blade_wolf, parent: :hltb_game do
    name "Metal Gear Rising: Revengeance - Blade Wolf DLC"
    url "http://howlongtobeat.com/game.php?id=5906"
    main_length 1
    main_with_extras_length 1
    completionist_length 0
  end

  factory :metal_gear_jetstream, parent: :hltb_game do
    name "Metal Gear Rising: Revengeance - Jetstream DLC"
    url "http://howlongtobeat.com/game.php?id=5907"
    main_length 1
    main_with_extras_length 2
    completionist_length 0
  end

  factory :braid, parent: :hltb_game do
    name "Braid"
    url "http://howlongtobeat.com/game.php?id=1290"
    main_length 5
    main_with_extras_length 6
    completionist_length 7
  end

  factory :civ_iv, parent: :hltb_game do
    name "Sid Meier's Civilization IV"
    url "http://howlongtobeat.com/game.php?id=8505"
    main_length 8.5
    main_with_extras_length 22
    completionist_length 30
  end

  factory :batman_arkham_asylum, parent: :hltb_game do
    name "Batman: Arkham Asylum"
    url "http://howlongtobeat.com/game.php?id=881"
    main_length 12
    main_with_extras_length 16.5
    completionist_length 25.5
  end

  factory :red_faction_guerrilla, parent: :hltb_game do
    name "Red Faction: Guerrilla"
    url "http://howlongtobeat.com/game.php?id=7689"
    main_length 14
    main_with_extras_length 20.5
    completionist_length 36.5
  end

  factory :fallout_3, parent: :hltb_game do
    name "Fallout 3"
    url "http://howlongtobeat.com/game.php?id=3340"
    main_length 25.5
    main_with_extras_length 61
    completionist_length 123.5
  end
end
