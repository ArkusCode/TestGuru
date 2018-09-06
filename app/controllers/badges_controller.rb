class BadgesController < AuthenticatedController

  def index
    @badges = current_user.badges
  end

  def show_all
    @all_badges = Badge.all
  end
end
