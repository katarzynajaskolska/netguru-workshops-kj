class UsersController < ApplicationController

  expose(:user)
  expose(:users)
  before_action :proper_user, only: :show
  before_action :admin_user, only: :index

  def show
  end

  def index
  end

  private

    def proper_user
      unless user == current_user || current_user.admin?
        redirect_to root_path, flash: {danger: 'You are not allowed to view this page.'}
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, flash: {danger: 'User does not exist.'}
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
