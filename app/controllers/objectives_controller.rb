class ObjectivesController < ApplicationController

  def new
    @objective = Objective.new
  end

  def index
    @objectives = Objective.all
    @objective = Objective.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
  end

  def show
    @objective = Objective.find(params[:id])
    @objective_comment = ObjectiveComment.new
    @users = @objective.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @objective = Objective.new(objective_params)
    @objective.user_id = current_user.id
    if @objective.save
      redirect_to objective_path(@objective.id), notice: 'You have created book successfully'
    else
      @user = current_user
      render "index"
    end
  end

  def update
    @objective = Book.find(params[:id])
    @objective.update(objective_params)
    if @book.save
      redirect_to book_path(@book.id), notice: 'You have updated book successfully'
    else
      render "edit"
    end
  end

  def destroy
    objective = Objective.find(params[:id])
    objective.destroy
    redirect_to objective_path(@objective.id)
  end

  private

  def objective_params
    params.require(:objective).permit(:title, :content, :image, :money)
  end
end
