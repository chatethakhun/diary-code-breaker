module PagesHelper
  BADGES = %w(bg-primary bg-secondary bg-success bg-danger bg-dark)

  def get_badge_class
    BADGES.sample
  end

  def formatted_duration(total_seconds)
    hours = total_seconds / (60 * 60)
    minutes = (total_seconds / 60) % 60

    "#{hours > 0 ? "#{hours} h" : ""} #{ minutes > 0 ? "#{minutes} m" : "" } m"
  end
end
