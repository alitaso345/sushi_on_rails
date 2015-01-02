class SushiController < ApplicationController
  before_action :itamae

  def index
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

  private
  def itamae
    Sushi.search
    @sushis = Sushi.order('created_at DESC').page(params[:page])
  end
end

