class SessionsController < Devise::SessionsController

  def create
    super

    flash[:notice] = t('.welcome', user: current_user.first_name)
  end
end
