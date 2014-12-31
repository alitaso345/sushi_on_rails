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

  def tumblr_photo
    @sushi_urls_from_tumblr = get_sushi_from_tumblr()
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

  def get_sushi_from_tumblr
    sushi_photos = []
    client = Tumblr::Client.new
    posts = client.tagged("寿司",{})
    posts.each do |post|
      if(post["type"] == "photo")
        post["photos"].each do |potho|
          sushi_photos.push(potho["alt_sizes"][2]["url"])
        end
      end
    end

    sushi_photos
  end
end

