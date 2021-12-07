require "rails_helper"

RSpec.describe "plan_comments#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/plan_comments/#{plan_comment.id}", params: params
  end

  describe "basic fetch" do
    let!(:plan_comment) { create(:plan_comment) }

    it "works" do
      expect(PlanCommentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("plan_comments")
      expect(d.id).to eq(plan_comment.id)
    end
  end
end
