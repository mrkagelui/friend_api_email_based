require 'rails_helper'

RSpec.describe Api::V1::Update::ReceiversController, type: :controller do
  before(:each) do
    # user0 <-(friend)-> user3, user1 -(follow)-> user3, user2 -(block)-> user3
    # user1 <-(friend)-> user2, user1 -(block)-> user2
    Friendship.find_or_create_by friend1: "user0@email.com", friend2: "users3@email.com"
    Friendship.find_or_create_by friend1: "user1@email.com", friend2: "users2@email.com"
    Following.find_or_create_by source: "users3@email.com", audience: "user1@email.com"
    Blockade.find_or_create_by blocker: "users2@email.com", blockee: "users3@email.com"
    Blockade.find_or_create_by blocker: "user1@email.com", blockee: "users2@email.com"
  end

  context "when retrieving recipients of an update" do
    it "should return bad_request when sender email invalid" do
      post :retrieve, { params: 
                        { 
                          sender: "bruce_wayne@test",
                          text: "hello user0@email.com"
                        },
                        format: :json
                      }
      expect(response).to have_http_status :bad_request
    end

    it "should not return users in block even if he is a friend" do
      post :retrieve, { params: 
                        { 
                          sender: "users2@email.com",
                          text: "hello user0@email.com" 
                        },
                        format: :json
                      }
      expect(response).to have_http_status :ok
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['success']).to be true
      expect(parsed_body['recipients']).not_to include "user1@email.com"
    end
  
    it "should return friend even if not mentioned" do
      post :retrieve, { params: 
                        { 
                          sender: "user1@email.com",
                          text: "hello user0@email.com" 
                        },
                        format: :json
                      }
      expect(response).to have_http_status :ok
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['success']).to be true
      expect(parsed_body['recipients']).to include "users2@email.com"
    end
  
    it "should return friend, follower and strangers mentioned" do
        post :retrieve, { params: 
                          { 
                            sender: "users3@email.com",
                            text: "hello user0@email.com stranger@test.com}" 
                          },
                          format: :json
                        }
      expect(response).to have_http_status :ok
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['success']).to be true
      expect(parsed_body['recipients']).to include "user0@email.com"
      expect(parsed_body['recipients']).to include "user1@email.com"
      expect(parsed_body['recipients']).to include "stranger@test.com"
    end
  end
end
