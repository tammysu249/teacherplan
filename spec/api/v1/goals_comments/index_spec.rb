require 'rails_helper'

RSpec.describe "goals_comments#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/goals_comments", params: params
  end

  describe 'basic fetch' do
    let!(:goals_comment1) { create(:goals_comment) }
    let!(:goals_comment2) { create(:goals_comment) }

    it 'works' do
      expect(GoalsCommentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['goals_comments'])
      expect(d.map(&:id)).to match_array([goals_comment1.id, goals_comment2.id])
    end
  end
end
