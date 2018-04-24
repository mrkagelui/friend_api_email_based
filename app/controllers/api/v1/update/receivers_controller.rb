class Api::V1::Update::ReceiversController < ApplicationController
  include Helpers::Helper

  def retrieve
  	sender = update_params[:sender]
    if /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$/.match? sender
      friends = get_friends_of sender
      followers = get_followers_of sender
      mentioned_emails = update_params[:text].scan(
        /\b([A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6})\b/).flatten
      blockers = get_blockers_of sender
      receivers = (friends | followers | mentioned_emails) - blockers
      render json: { success: true, recipients: receivers }, status: :ok
    else
      render json: { status: :bad_request, error: "sender email not valid", message: 'Please check sender email' }, 
              status: :bad_request
    end
  end

  private

  def update_params
    params.permit(:sender, :text)
  end
end
