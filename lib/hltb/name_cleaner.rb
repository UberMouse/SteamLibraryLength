module HLTB
  class NameCleaner
    def call(game_name)
      fixer_functions = self.methods.grep(/fix/)
      fixer_functions.map{|ff_name| method(ff_name)}
                     .reduce(game_name) {|game_name, fixer| fixer.call(game_name)}.strip
    end

    def fix_goty_edition(game_name)
      game_name.sub('GOTY Edition', '')
               .sub('Game of the Year Edition', '')
    end

    def fix_steam_edition(game_name)
      game_name.sub('Steam Edition', '')
    end
  end
end
