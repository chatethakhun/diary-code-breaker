class PagesController < ApplicationController
  def home

  end

  def cooking_run
    @coupons = Coupon.all
  end

  def avgle
    page = params[:page].present? ? params[:page].to_i : 0
    @limit = 40
    @category = params[:category]
    @categories = HTTParty.get('https://api.avgle.com/v1/categories')['response']['categories']
    if @category != 'watch_lated'
      response = HTTParty.get("https://api.avgle.com/v1/videos/#{page}?limit=#{@limit}&c=#{@category}")
      @list_av = response['response']['videos']
    else
      @list_av = AvgleMovie.all
    end
  end

  def avgle_show

    vid = params[:vid]
    response = HTTParty.get("https://api.avgle.com/v1/video/#{vid}")
    @av = response['response']['video']
  end

  def av_search
    @limit = 40
    page = params[:page].present? ? params[:page].to_i : 0

    if params[:keyword].present?
      keyword = CGI.escape params[:keyword] || ''
      response = HTTParty.get("https://api.avgle.com/v1/search/#{keyword}/#{page}?limit=#{@limit}")
      @list_av = response['response']['videos']
    else
      redirect_to avgle_path
    end
  end
end
