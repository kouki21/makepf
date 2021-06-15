class ObjectiveCommentsController < ApplicationController
  
  def create
    @objective_comment = ObjectiveComment.new
    @objective = Objective.find(params[:objective_id])
    comment = current_user.objective_comments.new(objective_comment_params)
    comment.objective_id = @objective.id
    #上の記述はコメントはどの本に対してコメントしたのかを一致させる
    comment.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    ObjectiveComment.find_by(id: params[:id], objective_id: params[:objective_id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  def objective_comment_params
    params.require(:objective_comment).permit(:comment)
  end
end
