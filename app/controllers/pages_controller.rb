class PagesController < ApplicationController
  def home

  end

  def cooking_run
    @coupons = Coupon.all
  end

  def avgle
    page = 0
    limit = 10
    @list_av = HTTParty.get("https://api.avgle.com/v1/videos/#{page}?limit=#{limit}")['response']['videos']
  end

  def av_show
    vid = params[:vid]
    @av = HTTParty.get("https://api.avgle.com/v1/videos/#{vid}")['response']['videos']
  end
end
