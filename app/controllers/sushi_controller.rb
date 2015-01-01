class SushiController < ApplicationController
  before_action :itamae

  def index
  end
  
  def flickr_photo
    @sushi_from_flickr = Sushi.get_sushi_from_flickr()
  end

  def twitter_photo
    @sushi_from_twitter = Sushi.get_sushi_from_twitter()
  end

  def tumblr_photo
    @sushi_from_tumblr = Sushi.get_sushi_from_tumblr()
  end

  private
  def itamae
    Sushi.search
    @sushis = Sushi.order('created_at DESC').page(params[:page])
  end
end

