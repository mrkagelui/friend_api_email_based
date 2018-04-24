require 'rails_helper'

RSpec.describe Api::V1::BlockadesController, type: :controller do
  context "when doing POST create" do
    it "should return bad_request when email not valid" do
      post :create, { params: { requestor: "alice@bob.com", target: "alice@" }, format: :json }
      expect(response).to have_http_status :bad_request
    end

    it "should return ok under normal circumstances" do
      post :create, { params: { requestor: "alice@bob.com", target: "bob@alice.com" }, format: :json }
      expect(response).to have_http_status :ok
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['success']).to be true
    end
  end
end
