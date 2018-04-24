class Api::V1::FriendshipsController < ApplicationController
  def create
    friend_emails = params[:friends]
    if friend_emails[0] < friend_emails[1]
      Friendship.create!(friend1: friend_emails[0], friend2: friend_emails[1])
    else
      Friendship.create!(friend1: friend_emails[1], friend2: friend_emails[0])
    end
    render json: { success: true }, status: :created
  end

  def get_friends
    friend2s = Friendship.where("friend1 = ?", params[:email]).collect(&:friend2)
    friend1s = Friendship.where("friend2 = ?", params[:email]).collect(&:friend1)
    friends = friend1s | friend2s
    render json: { success: true, friends: friends, count: friends.length }, status: :ok
  end
end
