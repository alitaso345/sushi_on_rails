class Sushi < ActiveRecord::Base
  class << self
    def search
      results = get_sushi_from_tumblr()

      results
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
  end
end
