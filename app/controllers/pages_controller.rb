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

  def avgle_show

    vid = params[:vid]
    response = HTTParty.get("https://api.avgle.com/v1/video/#{vid}")
    @av = response['response']['video']
  end

  def av_search

    page = params[:page].present? ? params[:page].to_i : 0
    limit = 40
    keyword = CGI.escape params[:search][:keyword]
    response = HTTParty.get("https://api.avgle.com/v1/search/#{keyword}/#{page}?limit=#{limit}")

    @list_av = response['response']['videos']

  end
end
