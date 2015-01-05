require 'hltb/game'

module HLTB
  class Parser
    def initialize(search_result)
      @parsed_results = Nokogiri::HTML.fragment(search_result)
      raise ArgumentError, 'search_result is nil' unless search_result.present?
      raise ArgumentError, 'Invalid HTML for search_result' unless @parsed_results.css('.gamelist_list').present?
    end

    def call
      extract_games(@parsed_results)
    end

    private
    def extract_games(dom)
      games = dom.css('.gamelist_details')
      games.map{|g| parse_game(g)}
    end

    def parse_game(game_node) 
      header_node = game_node.xpath('.//h3/a')
      title = header_node.attribute('title').value
      relative_url = header_node.attribute('href').value
      times = game_node.xpath('.//div/div/div')
      main = parse_time(times[1])
      main_with_extras = parse_time(times[3])
      completionist = parse_time(times[5])

      HLTB::Game.new(title, "http://howlongtobeat.com/#{relative_url}", main, main_with_extras, completionist)
    end

    def parse_time(time)
      cleaned_time = "0" if cleaned_time == "N/A"

      cleaned_time = time.text.sub('½', '.5').sub(' Hours', '')
      cleaned_time.to_f
    end
  end
end
