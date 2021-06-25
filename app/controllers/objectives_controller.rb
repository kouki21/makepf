class ObjectivesController < ApplicationController

  def new
    @objective = Objective.new
  end

  def index
    @objectives = Objective.all
    @objective = Objective.find(Favorite.group(:objective_id).order('count(objective_id) desc').limit(5).pluck(:objective_id))
  end

  def show
    @objective = Objective.find(params[:id])
    @objective_comment = ObjectiveComment.new
    @user = @objective.user
  end

  def edit
    @objective = Objective.find(params[:id])
  end

  def create
    @objective = Objective.new(objective_params)
    @objective.user_id = current_user.id
    if @objective.save
      redirect_to objective_path(@objective.id)
    else
      @user = current_user
      @objectives = Objective.all
      render "index"
    end
  end

  def update
    @objective = Objective.find(params[:id])
    @objective.update(objective_params)
    if @objective.save
      redirect_to objective_path(@objective.id)
    else
      render "edit"
    end
  end

  def destroy
    objective = Objective.find(params[:id])
    objective.destroy
    redirect_to user_path(@user.id)
  end

  private

  def objective_params
    params.require(:objective).permit(:title, :content, :image, :money)
  end
end
