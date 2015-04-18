class UsersController < ApplicationController

  expose(:user)
  before_action :proper_user, only: :show

  def show
  end

  private

    def proper_user
      unless user == current_user || current_user.admin?
        redirect_to root_path, flash: {danger: 'You are not allowed to view this page.'}
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, flash: {danger: 'User does not exist.'}
    end

end
