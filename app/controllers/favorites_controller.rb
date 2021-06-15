class FavoritesController < ApplicationController

  def create
    objective = Objective.find(params[:objective_id])
    favorite = current_user.favorites.new(objective_id: objective.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end

   def destroy
    objective = Objective.find(params[:objective_id])
    favorite = current_user.favorites.find_by(objective_id: objective.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
