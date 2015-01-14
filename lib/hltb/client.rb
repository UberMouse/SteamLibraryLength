require 'hltb/parser'
require 'hltb/name_cleaner'
require "net/http"
require "uri"


module HLTB
  class Client

    def initialize()
      @cleaner = HLTB::NameCleaner.new
    end

    def lookup(game)
      cleaned_name = @cleaner.call(game)

      search_result = search(cleaned_name)
      games = parse_results(search_result)
      find_matching_game(cleaned_name, games)
    end

    def search(game)
      search_endpoint = URI.parse('http://www.howlongtobeat.com/search_main.php?t=games&page=1&sorthead=popular&sortd=Normal%20Order&plat=&detail=0')
      response = Net::HTTP.post_form(search_endpoint, {queryString: game})
      response.body
    end

    def parse_results(search_result)
      parser = HLTB::Parser.new(search_result)
      parser.call
    end

    def find_matching_game(game, games)
      stripped_name = normalize_name(game)
      candidates = games.select{|g| normalize_name(g.title) == stripped_name}
      raise Exception, "more than one game with same name for #{game}" if candidates.length > 1

      candidates.first
    end

    def normalize_name(name)
      name.gsub(/[^A-Za-z0-9\s]/i, '')
          .downcase
          .strip
    end
  end
end
