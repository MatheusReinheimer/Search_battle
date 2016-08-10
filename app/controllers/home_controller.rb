class HomeController < ApplicationController

  respond_to :json, :html

  def index
  end

  def serv_scrapers
    @bing_ac = Scrapers::BingScraper.new.run(params[:param])
    @gg_ac = Scrapers::GoogleScraper.new.run(params[:param])

    @arr = [
      { google: @gg_ac },
      { bing: @bing_ac }
    ]

    # render json: { result: arr }

   render layout: false, :result => @arr
  end
end
