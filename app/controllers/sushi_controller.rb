class SushiController < ApplicationController
  def index
    search_result = Sushi.search()
    search_result.each do |sushi_data|
      sushi = Sushi.new
      sushi.url = sushi_data[:url]
      sushi.provider = sushi_data[:provider]
      sushi.save
    end
    @all_sushi = Sushi.all
  end
  
  def flickr_photo
    photos = flickr.photos.search(text: '寿司', license:"1,2,3,4,5,6")
    @sushi_urls = Array.new
    photos.each do |photo|
      @sushi_urls.push("http://farm#{photo.farm}.static.flickr.com/#{photo.server}/#{photo.id}_#{photo.secret}_n.jpg")
    end
  end

  def twitter_photo
    @sushi_from_twitter = Sushi.get_sushi_from_twitter
  end

  def tumblr_photo
    @sushi_from_tumblr = Sushi.get_sushi_from_tumblr()
  end
end

