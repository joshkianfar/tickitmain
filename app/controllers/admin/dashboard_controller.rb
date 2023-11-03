class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!
  before_action :check_admin

  def index
    @active_users = User.count
    @active_items = Item.where(state: 'active').count
    @sold_items = Item.where(state: 'sold').count
    @revenues_total = Revenue.sum(:amount)
    # ... add any other relevant statistics
  end
end

private

def authenticate_admin!
end

def check_admin
  unless current_user.admin?
    flash[:alert] = "You are not authorized to access this page."
    redirect_to root_path
  end
end
