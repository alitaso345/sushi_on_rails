require 'twitter_client'

class Sushi < ActiveRecord::Base
  validates :url, uniqueness: true

  class << self
    def search
      results = get_sushi_from_twitter() + get_sushi_from_tumblr() + get_sushi_from_flickr()
      results
    end

    def get_sushi_from_twitter()
      photos = Array.new
      sushi_tweets = TwitterClient.client.search("#寿司").to_h[:statuses]
      sushi_tweets.each do |tweet|
        images = tweet[:entities][:media]
        if images.class == Array
          images.each do |image|
            photos.push({:url => image[:media_url], :provider => "twitter"})
          end
        end
      end
      photos
    end

    def get_sushi_from_tumblr()
      sushi_photos = []
      client = Tumblr::Client.new
      posts = client.tagged("寿司",{})
      posts.each do |post|
        if(post["type"] == "photo")
          post["photos"].each do |photo|
            sushi_photos.push({:url =>  photo["alt_sizes"][2]["url"], :provider => "tumblr" })
          end
        end
      end

      sushi_photos
    end

    def get_sushi_from_flickr()
      photos = flickr.photos.search(text: '寿司')
      sushi_data = []
      photos.each do |photo|
        sushi_data.push({:url => "http://farm#{photo.farm}.static.flickr.com/#{photo.server}/#{photo.id}_#{photo.secret}_n.jpg", :provider => "flickr"})
      end
      sushi_data
    end
  end
end
