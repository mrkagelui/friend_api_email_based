class Api::V1::FollowingsController < ApplicationController
  def create
    Following.create!(source: follow_params[:target], audience: follow_params[:requestor])
    render json: {"success": true}, status: :ok
  end
  
  private

  def follow_params
    params.permit(:requestor, :target)
  end
end
