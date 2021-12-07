require 'rails_helper'

RSpec.describe "goals_comments#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/goals_comments/#{goals_comment.id}"
  end

  describe 'basic destroy' do
    let!(:goals_comment) { create(:goals_comment) }

    it 'updates the resource' do
      expect(GoalsCommentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { GoalsComment.count }.by(-1)
      expect { goals_comment.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
