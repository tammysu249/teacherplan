require 'rails_helper'

RSpec.describe "plan_comments#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/plan_comments/#{plan_comment.id}", payload
  end

  describe 'basic update' do
    let!(:plan_comment) { create(:plan_comment) }

    let(:payload) do
      {
        data: {
          id: plan_comment.id.to_s,
          type: 'plan_comments',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(PlanCommentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { plan_comment.reload.attributes }
    end
  end
end
