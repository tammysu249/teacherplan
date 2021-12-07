require 'rails_helper'

RSpec.describe "goals_comments#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/goals_comments", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'goals_comments',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(GoalsCommentResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { GoalsComment.count }.by(1)
    end
  end
end
