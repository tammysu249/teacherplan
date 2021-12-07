require "rails_helper"

RSpec.describe "plan_comments#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/plan_comments", params: params
  end

  describe "basic fetch" do
    let!(:plan_comment1) { create(:plan_comment) }
    let!(:plan_comment2) { create(:plan_comment) }

    it "works" do
      expect(PlanCommentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["plan_comments"])
      expect(d.map(&:id)).to match_array([plan_comment1.id, plan_comment2.id])
    end
  end
end
