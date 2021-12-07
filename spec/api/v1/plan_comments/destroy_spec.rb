require "rails_helper"

RSpec.describe "plan_comments#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/plan_comments/#{plan_comment.id}"
  end

  describe "basic destroy" do
    let!(:plan_comment) { create(:plan_comment) }

    it "updates the resource" do
      expect(PlanCommentResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { PlanComment.count }.by(-1)
      expect { plan_comment.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
