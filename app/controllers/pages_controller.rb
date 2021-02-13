class PagesController < ApplicationController
  def home

  end

  def cooking_run
    @coupons = Coupon.all
  end

  def avgle
    page = params[:page].present? ? params[:page].to_i : 0
    limit = 40
    response = HTTParty.get("https://api.avgle.com/v1/videos/#{page}?limit=#{limit}")
    @tatal_pag_tab = response['response']['total_videos'] / limit
    @list_av = response['response']['videos']
  end

  def av_show
    vid = params[:vid]
    @av = HTTParty.get("https://api.avgle.com/v1/videos/#{vid}")['response']['videos']
  end
end
