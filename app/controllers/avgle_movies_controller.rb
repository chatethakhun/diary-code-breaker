class AvgleMoviesController < ApplicationController

  before_action :set_avgle_movie, only: %w(destroy)

  def watch_lated
    vid = params[:vid]
    response = HTTParty.get("https://api.avgle.com/v1/video/#{vid}")
    av = response['response']['video']

    @avgle_movie = AvgleMovie.new({
                                    vid: av['vid'],
                                    title: av['title'],
                                    duration: av['duration'],
                                    framerate: av['framerate'],
                                    hd: av['hd'],
                                    viewnumber: av['viewnumber'],
                                    likes: av['likes'],
                                    dislikes: av['dislikes'],
                                    video_url: av['video_url'],
                                    embedded_url: av['embedded_url'],
                                    preview_url: av['preview_url'],
                                  })


    if @avgle_movie.save!
      redirect_to avgle_path, notice: 'เซฟในดูคราวหลังแล้ว'
    end
  end

  def destroy
    @avgle_movie.destroy
    redirect_to avgle_path(category: 'watch_lated'), notice: 'ลบเรียบร้อย.'
  end

  private

  def set_avgle_movie
    @avgle_movie = AvgleMovie.find(params[:id])
  end
end
