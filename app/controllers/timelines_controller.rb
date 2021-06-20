class TimelinesController < ApplicationController
  def show
    @objective_all = Objective.includes(:user,:taggings,:like_users,:likes)
    @user = current_user
   #フォローしているユーザーを取得
    @follow_users = @user.all_following
   #フォローユーザーのツイートを表示
    @objectives = @objective_all.where(user_id: @follow_users).order("created_at DESC").page(params[:page]).per(10)
  end
end
