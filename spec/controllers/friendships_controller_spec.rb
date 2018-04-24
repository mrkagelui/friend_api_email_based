require 'rails_helper'

RSpec.describe Api::V1::FriendshipsController, type: :controller do
  before(:each) do
    @friends = create(:friendship)
  end

  context "when doing POST create" do
    it "return success under normal circumstance" do
      post :create, { params: { friends: ["a@test.com", "b@test.com"] }, format: :json }
      expect(response).to have_http_status :created
      parsed_body = JSON.parse(response.body)
      expect(parsed_body).to have_key 'success'
      expect(parsed_body['success']).to be true
    end

    it "return bad_request when either email is invalid" do
      post :create, { params: { friends: ["a@test.com", "b@test"] }, format: :json }
      expect(response).to have_http_status :bad_request
    end
  end

  context "when doing GET get_friends" do
    it "should return success and 0 friends when there is none" do
      get :get_friends, { params: { email: "a@test.com" }, format: :json }
      expect(response).to have_http_status :ok
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['success']).to be true
      expect(parsed_body['count']).to be 0
      expect(parsed_body['friends'].length).to be 0
    end

    it "should return success and all friends" do
      get :get_friends, { params: { email: @friends.friend1 }, format: :json }
      expect(response).to have_http_status :ok
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['success']).to be true
      expect(parsed_body['count']).to be 1
      expect(parsed_body['friends'].length).to be 1
      expect(parsed_body['friends']).to include @friends.friend2
    end
  end

  context "when doing GET get_common_friends" do
    it "should return nothing when there is no common friends" do
      post :get_common_friends, { params: { friends: [@friends.friend1, "b@test.com"] }, format: :json }
      expect(response).to have_http_status :ok
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['success']).to be true
      expect(parsed_body['count']).to be 0
    end

    it "should return all common friends when there is any" do
      Friendship.create friend1: @friends.friend1, friend2: "alice@bob.com"
      post :get_common_friends, { params: { friends: [@friends.friend2, "alice@bob.com"] }, format: :json }
      expect(response).to have_http_status :ok
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['success']).to be true
      expect(parsed_body['count']).to be 1
      expect(parsed_body['friends']).to include @friends.friend1
    end
  end
end