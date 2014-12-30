class SushiController < ApplicationController
  def flickr_photo
    @photos = flickr.photos.search(text: '寿司', license:"1,2,3,4,5,6")
  end
end
