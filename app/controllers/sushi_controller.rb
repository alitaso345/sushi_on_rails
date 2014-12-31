class SushiController < ApplicationController
  def flickr_photo
    photos = flickr.photos.search(text: '寿司', license:"1,2,3,4,5,6")
    @sushi_urls = Array.new
      photos.each do |photo|
      @sushi_urls.push("http://farm#{photo.farm}.static.flickr.com/#{photo.server}/#{photo.id}_#{photo.secret}_n.jpg")
    end

  end

  def tumblr_photo
    @sushi_urls_from_tumblr = get_sushi_from_tumblr()
  end
end
