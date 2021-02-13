module PagesHelper
  BADGES = %w(bg-primary bg-secondary bg-success bg-danger bg-dark)

  def get_badge_class
    BADGES.sample
  end
end
