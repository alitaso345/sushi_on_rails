class SushiController < ApplicationController
  def flickr
    @photos = flickr.photos.search(text: '寿司', license:"1,2,3,4,5,6")
  end
end
