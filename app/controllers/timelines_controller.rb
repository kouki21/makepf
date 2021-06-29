class TimelinesController < ApplicationController
  def show
    @user = current_user

    @follow_users = current_user.following_users

    @objectives = Objective.where(user_id: @follow_users.ids).order("created_at DESC")

  end
end