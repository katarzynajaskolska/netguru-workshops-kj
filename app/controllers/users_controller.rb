class UsersController < ApplicationController

  expose(:user)
  before_action :proper_user, only: :show

  def show
  end

  private

    def proper_user
      unless user == current_user
        redirect_to root_path, flash: {error: 'You are not allowed to view this page.'}
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, flash: {error: 'User does not exist.'}
    end

end
