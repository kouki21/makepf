class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @objectives = Objective.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to
  end

  private

  def user_params
    params.require(:user).parmit(:name, :introduction, :profile_image)
  end
end
