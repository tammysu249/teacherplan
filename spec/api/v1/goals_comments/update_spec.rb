require 'rails_helper'

RSpec.describe "goals_comments#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/goals_comments/#{goals_comment.id}", payload
  end

  describe 'basic update' do
    let!(:goals_comment) { create(:goals_comment) }

    let(:payload) do
      {
        data: {
          id: goals_comment.id.to_s,
          type: 'goals_comments',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(GoalsCommentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { goals_comment.reload.attributes }
    end
  end
end
