require 'mechanize'

module Scrapers

  class BingScraper

    BASE_URL = 'https://www.bing.com/search?'

    def initialize
      @agent = Mechanize.new
    end

    def run(search = '')
      @search = search
      arg = {q: @search}

      @agent.get(BASE_URL, arg)

      doc = @agent.page

      doc_parse(doc)
    end

    def doc_parse(doc)
      results_array = []

      doc.parser.css('.b_algo').each do |parse_class|
        result_hash = {
          name:        parse_class.css('a').map(&:text).map(&:strip)[0],
          dns:         parse_class.css('cite').map(&:text).map(&:strip)[0],
          description: parse_class.css('p').map(&:text).map(&:strip)[0]
        }
        results_array << result_hash
      end
      results_array
    end

  end

end
