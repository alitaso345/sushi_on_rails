class SushiController < ApplicationController
  def index
    search_result = Sushi.search()
    search_result.each do |sushi_data|
      sushi = Sushi.new
      sushi.url = sushi_data[:url]
      sushi.provider = sushi_data[:provider]
      sushi.save
    end
    @all_sushi = Sushi.order(:created_at).reverse_order
  end
  
  def flickr_photo
    @sushi_from_flickr = Sushi.where(provider: "flickr")
  end

  def twitter_photo
    @sushi_from_twitter = Sushi.where(provider: "twitter")
  end

  def tumblr_photo
    @sushi_from_tumblr = Sushi.where(provider: "tumblr")
  end
end

