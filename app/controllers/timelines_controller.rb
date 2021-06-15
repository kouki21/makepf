class TimelinesController < ApplicationController
  def show
    @timelines = Timeline.find(params[:followed_id])
  end
end
