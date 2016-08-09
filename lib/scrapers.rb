module Scrapers

  def self.google_scraper(search = '')
    Scrapers::GoogleScraper.run(search)
  end

    def self.bing_scraper(search = '')
    Scrapers::BingScraper.run(search)
  end

end

require 'scrapers/google_scraper'
require 'scrapers/bing_scraper'