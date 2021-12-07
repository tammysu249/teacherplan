require "rails_helper"

RSpec.describe "goals_comments#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/goals_comments/#{goals_comment.id}", params: params
  end

  describe "basic fetch" do
    let!(:goals_comment) { create(:goals_comment) }

    it "works" do
      expect(GoalsCommentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("goals_comments")
      expect(d.id).to eq(goals_comment.id)
    end
  end
end
