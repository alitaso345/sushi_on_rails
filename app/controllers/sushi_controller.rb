require 'twitter_client'

class SushiController < ApplicationController
  def flickr_photo
    photos = flickr.photos.search(text: '寿司', license:"1,2,3,4,5,6")
    @sushi_urls = Array.new
    photos.each do |photo|
      @sushi_urls.push("http://farm#{photo.farm}.static.flickr.com/#{photo.server}/#{photo.id}_#{photo.secret}_n.jpg")
    end
  end

  def twitter_photo
    @sushi_urls_twitter = get_sushi_from_twitter
  end

  private
  def get_sushi_from_twitter 
    photos = Array.new
    sushi_tweets = TwitterClient.client.search("#寿司").to_h[:statuses]
    sushi_tweets.each do |tweet|
      images = tweet[:entities][:media]
      if images.class == Array
        images.each do |image|
          photos.push(image[:media_url])
        end
      end
    end
    photos
  end
end

