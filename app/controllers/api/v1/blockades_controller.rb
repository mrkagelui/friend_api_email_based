class Api::V1::BlockadesController < ApplicationController
  def create
    Blockade.create!(blockee: block_params[:target], blocker: block_params[:requestor])
    render json: {"success": true}, status: :ok
  end
  
  private

  def block_params
    params.permit(:requestor, :target)
  end
end
