class Api::V1::FriendshipsController < ApplicationController
  include Helpers::Helper
  def create
    friend_emails = params[:friends]
    inblock = Blockade.exists?(blocker: friend_emails[0], blockee: friend_emails[1]) || Blockade.exists?(blocker: friend_emails[1], blockee: friend_emails[0])
    if inblock
      render json: { status: :bad_request, error: "one of the users is blocking another", message: 'Friendship not added' }, status: :bad_request
    else
      if friend_emails[0] < friend_emails[1]
        Friendship.create!(friend1: friend_emails[0], friend2: friend_emails[1])
      else
        Friendship.create!(friend1: friend_emails[1], friend2: friend_emails[0])
      end
      render json: { success: true }, status: :created
    end
  end

  def get_friends
    friends = get_friends_of params[:email]
    render json: { success: true, friends: friends, count: friends.length }, status: :ok
  end

  def get_common_friends
    user_emails = params[:friends]
    common_friends = Array.new
    user_emails.each { |user_email| common_friends = (0 == common_friends.length) ? 
      get_friends_of(user_email) : common_friends & get_friends_of(user_email) }
    render json: { success: true, friends: common_friends, count: common_friends.length }, status: :ok
  end
end
