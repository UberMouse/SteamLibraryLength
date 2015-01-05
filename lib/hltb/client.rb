require 'hltb/parser'
require "net/http"
require "uri"

module HLTB
  class Client
    def lookup(game)
      search_result = search(game)
      games = parse_results(search_result)
      find_matching_game(game, games)
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
      candidates = games.select{|g| g.title == game}
      raise Exception, "more than one game with same name for #{game}" if candidates.length > 1

      candidates.first
    end
  end
end
