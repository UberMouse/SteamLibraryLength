module HLTB
  class NameCleaner
    def call(game_name, &normalizer)
      fixer_functions = self.methods.grep(/fix/)
      fixer_functions.map{|ff_name| method(ff_name)}
                     .reduce(normalizer.call(game_name)) {|game_name, fixer| fixer.call(game_name)}.strip
    end

    def fix_goty_edition(game_name)
      game_name.sub(/GOTY Edition/i, '')
               .sub(/Game of the Year Edition/i, '')
    end

    def fix_steam_edition(game_name)
      game_name.sub(/Steam Edition/i, '')
    end
  end
end
