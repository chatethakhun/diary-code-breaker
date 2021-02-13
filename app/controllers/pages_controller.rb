class PagesController < ApplicationController
  def home

  end

  def cooking_run
    @coupons = Coupon.all
  end
end
