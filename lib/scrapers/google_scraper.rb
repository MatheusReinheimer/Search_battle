require 'mechanize'

module Scrapers

  class GoogleScraper

    BASE_URL = 'https://www.google.com.br/search?'

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

      doc.parser.css('.g').each do |parse_class|
        result_hash = {
          name:        parse_class.css('.r a').map(&:text)[0],
          dns:         parse_class.css('.s cite').map(&:text).map(&:strip)[0],
          description: parse_class.css('.s span').map(&:text).last.gsub(/\n|\.\.\./,"").strip
        }
        results_array << result_hash
      end
      results_array
    end

  end

end
