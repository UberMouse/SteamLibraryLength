module HLTB
  class NameCleaner
    def call(game_name)
      fixer_functions = [:goty_edition]
      fixer_functions.map{|ff_name| method("fix_#{ff_name}".to_s)}
                     .reduce(game_name) {|game_name, fixer| fixer.call(game_name)}.strip
    end

    def fix_goty_edition(game_name)
      game_name.sub('GOTY Edition', '')
               .sub('Game of the Year Edition', '')
    end
  end
end
